# Securing SSH (Lab 04-1)

## Course Progression&#x20;

#### [Lab 01](virtual-firewall-and-windows-10-configuration.md)

* Gained familiarity with the course's lab environment.&#x20;
* Configured my own firewall that separates my local area network from the rest of the class (SYS255-WAN).&#x20;
* Configured a Windows 10 machine to communicate with the internet.&#x20;

#### [Lab 02](windows-server-2019-adds-and-dns.md)&#x20;

* Established my own internal DNS on a Windows Server 2019 in the lab environment&#x20;
* Gained familiarity with Windows Server 2019, and ADDS&#x20;

#### [Lab 03](linux.md)&#x20;

* Gained familiarity with CentOS Linux.&#x20;
* Configured dhcp01-luke to be on my network.
* Created an A and PTR record in my internal DNS for the new CentOS dhcp01-Luke machine.&#x20;
* Established an SSH session as Linux user "luke" from wks01 in PowerShell.
* Experimented with the CentOS Linux directory with bash commands on the SSH session.&#x20;

[Lab 04](dhcp.md)&#x20;

* Installed and configured DHCP service on dhcp01-luke.

## Discussion

In the SSH config file (/etc/ssh/sshd\_config) there's an option that allows or denies root login. It is set to the default, which allows root login. This is not secure, because hackers can use dictionaries of passwords to remotely brute force their way into the system. In turn, they gain access to the root of the dhcp01-luke server, which is a HUGE security issue. So, I'm going to disable remote access as root.

## [Tools](../tools.md)

* Nano

## [Technical Terms](../technical-terms.md)

## Objectives&#x20;

* Secure SSH on dhcp01-luke

## Step 1

On dhcp01-luke, I enter the command `sudo nano /etc/ssh/sshd_config`. This brings me to the ssh config file in the nano text editor.&#x20;

<figure><img src="../../.gitbook/assets/image (1).png" alt=""><figcaption><p>sshd_config in nano text editor</p></figcaption></figure>

I use the arrow keys to scroll down to the authentication section of the file. Next to "PermitRootLogin" is the option "yes". I change it to "no", as seen in the image above. Also, there was a # at the start of the line, which denotes the line to a comment. I removed the # symbol so the config file would actually read that line as a command. I press "CTRL + o" keys and then enter to save the file. I press "CTRL + x" to exit the file.

## Step 2

I want to make sure the file change was successful, so I attempted to log into dhcp01-luke as root from an SSH session on ad01-luke. I used the correct password, but it still denied me access. &#x20;

<figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption><p>attempted ssh login as root from ad01-luke powershell </p></figcaption></figure>

### Deliverable 1

<figure><img src="../../.gitbook/assets/image (1) (1).png" alt=""><figcaption><p>failed login attempts shown in the logs</p></figcaption></figure>

The image above is on dhcp01-luke. The logs show the failed login attempts to root. It's showing the problem is within the authentication section of the file sshd\_config "_(sshd:auth)_". That's where I made the change to the config file.

## Step 3&#x20;

### Deliverable 2

<figure><img src="../../.gitbook/assets/image (21).png" alt=""><figcaption><p>looking for uid</p></figcaption></figure>

The image above shows how to find a user's User ID (UID). In this case, the root's uid is 0. Luke's UID is 1000. I pulled this up using the command `grep "^`(username here)`:" /etc/passwd`.

Based on the logs, if the person trying to log in has a UID greater than or equal to luke's UID (1000), then a value of true returns, and the user can log in with the correct password. Since the root has a UID of 0, a value of false returns, and the user can't log in even with the correct password.

This allows any user accounts to log in, as they start at UID 1000. This denies root user logins because the root is always UID 0.

## Reflection&#x20;

At the top of the sshd\_config file:&#x20;

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption><p>readme part of config file denoting default values</p></figcaption></figure>

This tripped me up in the lab a bit because I didn't read this part until I eventually figured it out myself. I was wondering why I could still gain access to the root even after changing the "yes" to "no". It turned out that I left the # symbol, which denotes the line as a comment, and not a command. As it says in the image above, the pound symbols next to the lines leave the config as default, but when you remove the pound symbol, you can change the values from their defaults. Since I initially left the pound symbol there, my change did not matter as it was still technically the default value of "yes".&#x20;
