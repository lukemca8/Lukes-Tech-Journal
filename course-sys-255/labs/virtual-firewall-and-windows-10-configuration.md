---
description: Lab 01
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

# Virtual Firewall and Windows 10 Configuration

## Discussion

This lab is the beginning of creating a small enterprise network and is the first building block for future labs.

<figure><img src="https://lh3.googleusercontent.com/zySwo7CDBqvF41G3ee3ZC5oWYIXvwQwdGVQ_ARLnEzfRPqhiR6XmunwhDO_3bMxRrlf7mWe_elEVFjiYpFhFmQc9l4HeaQBMDx3g8rzetbjZkW__czpys0zJz8HnH7PnkyLPnJ-S4pkyGExKmN-i3Q" alt=""><figcaption><p>Current Network architecture </p></figcaption></figure>

## [Tools](../tools.md)

* Pfsense
* vSphere&#x20;
* Powershell&#x20;
* Command Prompt

## [Technical Terms](../technical-terms.md)&#x20;

* Upstream gateway&#x20;

## Objectives

* Gain familiarity with the course's lab environment.&#x20;
* Configure my own firewall that will separate my local area network from the rest of the class (SYS255-WAN)&#x20;
* Configure Windows 10 machine to communicate with the internet.

## Step 1&#x20;

Using [vsphere](../tools.md#vsphere), I assigned the WAN and LAN network adapters on my [pfSense](../tools.md#pfsense) firewall. This is under the virtual firewall's virtual hardware setting.

I powered up my firewall and assigned the 2 network interfaces on it to my WAN (em0) and LAN (em1).&#x20;

Next, I assigned IPs to the interfaces.&#x20;

WAN - 10.0.17.109/24\
([upstream gateway](../technical-terms.md#upstream-gateway) - 10.0.17.2)

LAN - 10.0.5.2/24 &#x20;

I'll come back to fw01 through the Pfsense web interface for further configuration after setting up a Windows 10 machine.

<figure><img src="../../.gitbook/assets/image (2) (1) (1) (1) (1).png" alt=""><figcaption><p>fw01</p></figcaption></figure>

## Step 2&#x20;

Using vsphere, I assigned my wks01 network adapter to my LAN segment.&#x20;

In my Windows OS now, I changed my computer name to wks01-Luke.&#x20;

Wks01-Luke only has a default champuser username and default password, so I set up a local admin account that I'll use going forward.  &#x20;

I also changed the wks01-luke Ipv4 and preferred DNS from the assigned default addresses.

<figure><img src="../../.gitbook/assets/image (1) (1) (1) (1) (1) (1).png" alt=""><figcaption><p>wks01-Luke Ipv4 setup</p></figcaption></figure>

## Step 3 &#x20;

Next, I logged into the pfSense web interface for the first time and went through the initial configuration. In order to get to the actual web interface, I entered _https://10.0.5.2/_ in my web browser on wk01-Luke.

* Hostname: fw1-Luke
* Domain: Luke.local
* Primary DNS: 8.8.8.8
* RFC1918 Networks:  Uncheck "Block private networks from entering via WAN"

I also changed the root password for the pfSense client from the default.

<figure><img src="../../.gitbook/assets/image (2) (1) (1) (1) (1) (1).png" alt=""><figcaption><p>pfSense setup wizard</p></figcaption></figure>

## Step 4

### Deliverable 1

Now back on my fw01 virtual machine, I get to the shell and ping champlain.edu with one packet. This confirms my firewall has access to the upstream gateway.

<figure><img src="https://lh3.googleusercontent.com/b8FHHslTZzOIH8xSoWE63A9pCgvAz1xgmu0B8WE8fgTavFAzU8zZ-lZHXHVpvsrhSKeP3izk40jdJIZMlV88Tdvy8yE7oaZxOh7NvozApo1ioXihc0jCHfdAdSoJCq995W8HEaooPvBpp5NJ7kobek4" alt=""><figcaption><p>ping is successful</p></figcaption></figure>

## Step 5&#x20;

### Deliverable 2&#x20;

Now back on wks01-Luke, I open [PowerShell](../tools.md#powershell) and run some basic commands to ensure the computer's identity and network configuration.&#x20;

`whoami` brings up the username of the current user.&#x20;

`Hostname` brings up the name I set for my Virtual computer.&#x20;

`Ping -n 1 "enter address"` tests the connection between two network devices by sending one packet.

`Ipconfig /all` brings up all of my basic network information and network adapters.

<figure><img src="https://lh5.googleusercontent.com/Uexvg453jrmJGaoG56SwPMwPaBR18ktgs7V_ncHTirxYG65BXEFqaSRZDyTdZqbvDt1b7DHxRmH6xZFVu4Y57cAiIAYGofMdhp-yYcya0Jie0ofIEic5lPY8dBAR9qu5_TK2NjHe8TQ4e2zW3957-oQ" alt=""><figcaption><p>powershell basic commands </p></figcaption></figure>

### Deliverable 3 &#x20;

This shows a successful connection and navigation from wks01-Luke to champlain.edu with the Google Chrome browser.&#x20;

<figure><img src="https://lh6.googleusercontent.com/eB0zjvfuV-NsaCJu4vRojFPtuxyD_2d03QxeSjBKpvWc9Zfmh53CupQwoywbPWYSubCneSVdmYkqA1RqFpfS0cTWw01Kx4MFSBoQiuTNyA0lRt33D4LRexbBxdyTe88DpmnquxUwdJSxnZ8t9JQMBbc" alt=""><figcaption><p>on champlain's domain</p></figcaption></figure>

### Deliverable 4 &#x20;

The image below shows an example of a `tracert` command with Champlain's domain in the [command prompt](../tools.md#command-prompt).&#x20;

Tracert follows the route a ping makes. It shows every hop the ping makes. When a hop occurs, the packet is sent to the next network device in the path to the final destination. `-h` lets you set the maximum amount of hops. In this example, I used 3.&#x20;

<figure><img src="https://lh5.googleusercontent.com/aVgxDguZ_sZU1ypW84vq_WQt8uJr3BtTxK0Q9NN3EbXrEZQUAF6_D1i21ZOM5L8i1pb5bAi0VosA_-YVTDQlfz6JKPgI6haBGUZ4i92a04VsaHiZgICi_mPQ3agLfrhexEsKD5n9_R9oFzPMF9ng4QI" alt=""><figcaption><p>cmd tracert command</p></figcaption></figure>

## Reflection &#x20;

Pfsense was totally new to me, being able to manage the firewall from a website was confusing to me. How does the website know which firewall to log into if everyone in the class is using the same IP to log into it? (10.0.5.2).  - The class WAN (10.0.17.0/24) goes down to everyone's own WAN interface (mine is 10.0.17.109/24) on their firewall, and it gives everyone their own LAN on the other firewall interface. Even though everyone's LAN IP is the same, the network is segmented down from their own WAN.

Configuring the ethernet adapter through Windows settings was new to me. I was confused if I should use 10.0.5.100 like in the ss, or 10.0.5.2. I tried the latter first and I couldn’t connect to the log-in page for pfSense, so I changed it to the 10.0.5.100. &#x20;

That was the first time I’ve used Powershell. There are cmd and PowerShell, what are the differences? Why would you use one over the other?
