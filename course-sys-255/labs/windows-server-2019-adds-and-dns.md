---
description: Lab 02
layout:
  title:
    visible: true
  description:
    visible: true
  tableOfContents:
    visible: true
  outline:
    visible: true
  pagination:
    visible: false
---

# Windows Server 2019, ADDS, and DNS

## Course Progression

#### Lab 01

* Gained familiarity with the course's lab environment.&#x20;
* Configured my own firewall that separates my local area network from the rest of the class (SYS255-WAN).&#x20;
* Configured a Windows 10 machine to communicate with the internet.

## Discussion

A Domain Name Server (DNS) should be used in a network with many devices so you can automatically associate IP addresses with hostnames. Without a DNS established in the network, you would have to manually associate IP addresses with hostnames. A DNS server and an active directory are paired together on a single platform for ease of use and efficient management. This lab uses an active directory and domain service on a Windows Server 2019 VM.&#x20;

## [Tools](../tools.md)&#x20;

* Server Manager
* Active directory domain services
* Windows Server 2019
* DNS Manager&#x20;

## [Technical Terms](../technical-terms.md)

* Domain controller&#x20;
* DNS
* AD Domain forest
* DNS queries
* DNS Record
* Reverse Lookup Zone
* Forward lookup zones
* Network ID
* Fully Qualified domain name (FQDN)
* PTR record
* A record
* Reverse DNS entry (PTR record)&#x20;
* Domain Administrator&#x20;
* reverse lookup&#x20;
* nslookup&#x20;

## Objectives&#x20;

* Establish an internal DNS on a Windows Server 2019 in the lab environment&#x20;
* Gain familiarity with Windows Server 2019, and ADDS management

## Step 1

On vSphere, I configured ad01's network adapter to my internal LAN. I logged into ad01 as a local administrator and set a password for the account. Now that I'm logged into the server, I change the ethernet adapter options for IPv4 properties:

| IP address | Netmask       | Default gateway | DNS      |
| ---------- | ------------- | --------------- | -------- |
| 10.0.5.5   | 255.255.255.0 | 10.0.5.2        | 10.0.5.2 |

Also, I changed the hostname to ad01-Luke and rebooted the server. After reboot, with all of the new settings, my local server manager dashboard looks like this:&#x20;

<figure><img src="../../.gitbook/assets/image (3).png" alt=""><figcaption><p>local server manager dashboard</p></figcaption></figure>

Just to make sure all of my settings are correct, I did a quick test with Powershell&#x20;

(note: `whoami`should show "ad01-Luke\administrator", but I took this screenshot after completing the lab while logged in as the Domain Administrator, not as the Local Administrator.)

<figure><img src="../../.gitbook/assets/image (6).png" alt=""><figcaption><p>Powershell test</p></figcaption></figure>

## Step 2

Next, I open the server manager, select "manage" at the top right, and click "Add Roles and Features". It then takes me through an installation setup wizard. I leave everything as default except the following:&#x20;

Active Directory Domain Services->Add Features-> and I then select Active Directory Domain Services.&#x20;

Select restart destination server-> and select yes on the confirmation box.&#x20;

_It takes a little bit for the installation to complete._&#x20;

After installation, next to the flag on the server manager dashboard, there is a yellow warning symbol. I expand it and click "promote this server to a domain controller".  This configures the ad01-luke server to be the primary domain controller for the upcoming domain luke.local.

## Step 3

Next, while in the Deployment Configuration section under the Active Directory Domain Services Configuration Wizard, I added a new forest and specified the root domain name as luke.local. After that, I created a DSRM password. Directory Services Restore Mode would be used if the directory needs to be recovered from an error. A reboot is required after the installation of the forest. &#x20;

_The server manager displays an error: "A delegation for this DNS server cannot be created because the authoritative parent zone cannot be found..." This error pops up after installation because I set the .local as a top-level domain. Genuine TLDs include .com, .gov, .edu, and .net. So the server manager is kind of confused about what I'm doing. This is just an internal domain, so it's fine to keep it like this._

## Step 4&#x20;

After rebooting the server, I log in as the Domain Administrator (credentials in Active Directory) instead of the local administrator (credentials in Windows OS)

<figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption><p>Log in page prompting for the Domain Administrator account. </p></figcaption></figure>

_After logging in, I noticed the ad01-luke server's network configuration has changed. The DNS server goes to 127.0.0.1 (local loopback adapter for ad01-luke). This means that DNS queries handled outside the local network are forwarded to fw01-luke, and then forwarded to its DNS Server._

<figure><img src="../../.gitbook/assets/image (10).png" alt=""><figcaption><p><em>ad01-luke server network configuration changes</em></p></figcaption></figure>

At this point in the lab, I can't ping fw01-luke by its hostname from ad01-luke, only Ipv4. To fix that, I'm going to make a DNS record on the server. This record will let anyone who uses ad01-luke as a DNS server ping the domain name fw01-luke.luke.local.&#x20;

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption><p>Creating the A record for fw01-luke. Checking the "Create associated pointer (PTR) record" will automatically create a PTR record. </p></figcaption></figure>

Currently, the PTR record is not in effect because there isn't a reverse lookup zone. So, I added a reverse primary lookup for the IP addresses in my LAN. To do this, I right-clicked on the "reverse lookup zone" folder under the DNS manager and then clicked on "New Zone".  &#x20;

This brings up the New Zone Wizard, which prompts for the Network ID, and the reverse lookup zone name.

<figure><img src="https://lh6.googleusercontent.com/0dMs9igxTjgt4Lrgq5glSNK_jgluoA9_nHwT3aWLJzc04VciHB-gtPTvM_mcQ7CWMPFSxV570JbAmtsp5BU6S6c52_DbHe674kdV0Ya9HXVfnpE3X0cnWWPCYqcvcpY3e4V2rolUl7bIFnkDTXn8Gw" alt=""><figcaption><p>New Zone Wizard</p></figcaption></figure>

Now the PTR record created previously will automatically go under the new reverse lookup zone. Also, from now on, anytime an A record is created for a device, a PTR record will be put under the new reverse lookup zone too.

<figure><img src="../../.gitbook/assets/image (1).png" alt=""><figcaption><p>Reverse Lookup zone</p></figcaption></figure>

## Step 5

CREATE NAMED DOMAIN USERS ON AD01





























<figure><img src="https://lh3.googleusercontent.com/fMt2e5ob3dTEHBuUesU2_XHbAo3BnYiPtCxHQCx-OtiGrpFMMUZtNO3Oqg9FN8eym4R4bWs45TlGl96aSG5Owc8epj9_PLzM29gSQBGqOOhjpctOpvq41pPcDt1V09K1-T7JktiWmxRIPrsyY9m9bSA" alt=""><figcaption><p>The image above shows that my windows computer successfully joined the domain.</p></figcaption></figure>

## Step 2

<figure><img src="https://lh4.googleusercontent.com/4lehT2rpcX6y5HVpdr2MwRYp1XufSfWd9GPxxL9mWS-Ac2uv9_8Iz_e3TJOPOoxVHPC1uxL9t-PMmm5f3UUTJe4BvwMm40p7j61Edj2iH2a6R86XPJIvHsRLiuvWbWzvGtYWjiNArjOiZAPIGtEKrUo" alt=""><figcaption><p>The image above shows the two users I created with the active directory.</p></figcaption></figure>

## Step 3&#x20;

<figure><img src="https://lh4.googleusercontent.com/edpid3SMziaqfMr4PLrX1lM1UB8qEd50ca0aQONWYfWJB1LDP9YQibIc8N300QGF-T3qsLmMq2tW7aKI2GZBchiT2GgnANDlQ860gJXAtaLZqWJNLzfMOwnfkYHbYz9RpVpNhhSGRidKRSbYh7j-qC4" alt=""><figcaption><p>The image above contains 5 commands verifying the lab’s completion. Nslookup 10.0.5.2 performs a reverse DNS query. Nslookup fw01-luke performs a query by host name. Nslookup luke.local performs a Domain DNS server search. Whoami shows that im logged into the domain as a regular user. Hostname shows what computer I’m on. </p></figcaption></figure>



##

##

##

##

##

##

##

##

## Notes:&#x20;

Set ad01-Luke eth0 to 10.0.5.5 on default gateway 10.0.5.2&#x20;

This is an internal domain we are making. &#x20;

Please note this difference: Domain Admins have power over items within an AD domain, whereas Local Admins have power over items within the singular installed OS and not within AD.  &#x20;

Please Note: Anytime you have a new system that needs to join the domain, it needs to refer to the domain’s DNS server.  This concept may trip you up in follow on assessments if you neglect this …

\




## questions

why is the network ID  that we created for the reverse primary lookup missing the last segment from its full IP? (10.0.5 instead of 10.0.5.0)

\






&#x20;





&#x20;&#x20;
