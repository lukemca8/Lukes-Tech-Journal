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

## Step 1:

##

##

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
