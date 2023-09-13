# Linux

## Course Progression

#### Lab 01

* Gained familiarity with the course's lab environment.&#x20;
* Configured my own firewall that separates my local area network from the rest of the class (SYS255-WAN).&#x20;
* Configured a Windows 10 machine to communicate with the internet.&#x20;

#### Lab 02&#x20;

* Established my own internal DNS on a Windows Server 2019 in the lab environment&#x20;
* Gained familiarity with Windows Server 2019, and ADDS&#x20;

## Discussion:&#x20;

It is extremely uncommon to come across a business that is entirely Windows, Mac, or Linux. You'll probably encounter a heterogeneous environment where a variety of operating systems are used to carry out the organization's objectives. I will set up the [CentOS](../tools.md#centos-linux) operating system in this lab. This particular operating system has been pre-built for me and is open source. It will be my responsibility to finish the configuration procedures so that my expanding business can use and manage it. &#x20;

## [Tools](../tools.md)&#x20;

* CentOS Linux&#x20;
* SSH&#x20;
* Directory
* Nmtui
* PuTTY
* YUM

## [Technical Terms](../technical-terms.md)&#x20;

* Bash
* Wheel
* Tree

## Objectives&#x20;

* Gain familiarity with CentOS Linux&#x20;
* Create an A and PTR record in my internal DNS for the new CentOS dhcp01-Luke machine.&#x20;
* Establish an [SSH session](../tools.md#ssh) as Linux user "luke" from wks01 in PowerShell.
* Experiment with the CentOS Linux [directory](../tools.md#directory) with [bash](../technical-terms.md#bash) commands on the SSH session.

## Step 1&#x20;

Using vSphere, I configured CentOS Linux dhcp01 to be on my internal LAN. &#x20;

After logging into dhcp01, I opened the [nmtui](../tools.md#nmtui) application and did network configuration. I also changed the name of the host from dhcp01 to dhcp01-luke.

| IPv4/Subnet Mask | Default Gateway     | DNS server | Search Domains |
| ---------------- | ------------------- | ---------- | -------------- |
| 10.0.5.3/24      | 10.0.5.2 (firewall) | 10.0.5.5   | luke.local     |

<figure><img src="../../.gitbook/assets/image (5).png" alt=""><figcaption><p>Nmtui</p></figcaption></figure>

I added user "luke" to dhcp01-luke and made it part of the [wheel](../technical-terms.md#wheel) group.&#x20;

### Deliverable 1

After completing the basic configurations for the system, I tested it to make sure it could communicate with the local network and WAN.&#x20;

<figure><img src="https://lh5.googleusercontent.com/mCvDnXsnKK3_-oRsKKA6a7uNhmJasHzEqCv-sKkacO_oq5it4Jr_hWTmHj6FejnD0zF8HH3A_fLtWbnWpxjh1l96SfyRpHzgb4dXJljKdvjuWmo3sVwgjjIEnfg0BDfyNnIqdesKO7LrNRS_f-4w9o4" alt=""><figcaption><p>Logged in as user luke, I execute three successful pings  to google.com, ad01-luke, and fw01-luke. This confirms I have properly setup dhcp01-luke.</p></figcaption></figure>

## Step 2

From ad01-luke, I use the DNS manager to add an A and PTR record for dhcp01-luke.&#x20;

<figure><img src="../../.gitbook/assets/image (9).png" alt=""><figcaption><p>A record for dhcp01-luke.</p></figcaption></figure>

### Deliverable 2

To test that the record was added correctly, I ping dhcp01-luke from wks01-luke.

<figure><img src="https://lh6.googleusercontent.com/iauQMTBo0zZSJM5kKxP5UTiinDL_SJOliF_W4mvz6qLQjoE5_D7fzHE60SmveK2cNebKBOG3-gxvqMsFf7iVfewKYoPyMupJg3FJruGUeh1c4KOovJZf_mmyDq0Bg_dsz5uDQH3jvxrSaghZ71nbJEI" alt=""><figcaption><p>Successful ping from wks01-luke to dhcp01-luke using hostname only.</p></figcaption></figure>

## Step 3&#x20;

System admins will remotely connect to Linux systems for management. [PuTTY](../tools.md#putty) is a popular ssh application, but requires installation. Using the SSH client Windows 10 comes with, I create a ssh session as Linux user luke from Powershell on wks01-luke.

### Deliverable 3

<figure><img src="https://lh5.googleusercontent.com/qBWcRsMHSnxyC-2imlWxpeAd65XVfOJigGkE3djpqrjNNn-FEBtDD7LpfVm0dmZ9L29xix8JmsVjuqHk-LSf7sRGiHMkbjckVtUzGbHHXqx7h7MyIX7xvlYMoPweoJ06inQGE-S3Ue9UYKFsIZhQ4rs" alt=""><figcaption><p>Successful ssh session established as Linux user “luke” from wks01.</p></figcaption></figure>

On the ssh session, I explore the dhcp01-luke directory with various commands in bash.&#x20;

| Command                                                                  | Function                                                                                                                     |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------- |
| <mark style="color:green;">`pwd`</mark>                                  | Shows the present working directory.                                                                                         |
| <mark style="color:green;">`cd`</mark>`*directory here*`                 | Used to navigate the directory to specified parts.                                                                           |
| <mark style="color:green;">`ls`</mark>                                   | Lists the contents of a directory.                                                                                           |
| <mark style="color:green;">`cd ..`</mark>                                | Used to navigate to the parent directory.                                                                                    |
| <mark style="color:green;">`ls -l`</mark>                                | Shows a long list of files and directories.                                                                                  |
| <mark style="color:green;">`man hier`</mark>                             | Shows the manual page explaining what each directory is used for in the file hierarchy.                                      |
| <mark style="color:green;">`cd ~`</mark>                                 | Navigates to the home directory.                                                                                             |
| <mark style="color:green;">`mkdir`</mark>`*directory here*`              | Creates a directory.                                                                                                         |
| <mark style="color:green;">`sudo`</mark>`*command here*`                 | Elevates user privileges to super user for one command.                                                                      |
| <mark style="color:green;">`groups`</mark>                               | Shows the groups your user is attached to.                                                                                   |
| <mark style="color:green;">`sudo -i`</mark>                              | Converts a normal user to the root user until exited. This gives ultimate privileges across the entire directory and system. |
| <mark style="color:green;">`yum install`</mark>`*package/software here*` | Uses the [YUM](../tools.md#yum) tool to install a package.                                                                   |
| <mark style="color:green;">`exit`</mark>                                 | Exits the shell you're in.                                                                                                   |
| <mark style="color:green;">`history`</mark>                              | Shows the history of commands typed.                                                                                         |
| <mark style="color:green;">`ls -la`</mark>                               | Lists hidden files in the pwd.                                                                                               |
| <mark style="color:green;">`cat`</mark>`*file here*`                     | Shows a file's data in a readable way.                                                                                       |
| <mark style="color:green;">`tree`</mark>                                 | Displays the list of files in the current directory.                                                                         |

I created a directory under the home directory for my user called SYS-255 with the `mkdir` command. Using sudo, I install the "tree" package:`sudo yum install tree` . The tree is a program that provides a depth-indented listing of files from a recursive directory. The tree displays the list of files in the current directory without any arguments.&#x20;

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption><p>A tree on dhcp01-luke.</p></figcaption></figure>

### Deliverable 4

I look at my command history so far after a little bit of experimentation with the command `history` .

<figure><img src="https://lh6.googleusercontent.com/7_vMyJKzdLJO-BoY8QC0bfkG1a998rj8ocIP7hmUJxWn9iI3p2ad7q7EGgU1yvSq6SWU83QcC2YmDJKWd6ysXPAa_o1jfuHSSDdhXk4t3TD2xdSQtAB4TIi1fQwYHaoUtTo8-Mo-HAVABoHhxhaixcQ" alt=""><figcaption><p>Showing my command history file from the ssh session as Linux user “luke” from wks01.</p></figcaption></figure>

### Deliverable 5

Part A: One pro for security with the history file is that you can see if any suspicious commands are being used by someone. A con would be someone looking at commands that have sensitive information about a company. A hacker could possibly see commands with a hacked SSH session.

Part B: The history -c command clears your .bash\_history file

## Reflection



\
