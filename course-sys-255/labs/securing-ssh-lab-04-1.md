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

<figure><img src="https://lh5.googleusercontent.com/9AldLjwoFbhtJ3a3niOpcdXfacFKsrJheLX931fF4ZBnIUgHgHOgrB4RmmHkLySPZOJ1TmVu9jbTxsgfXjdYWKvHzH8adDSSoAZku_GrYX5ZZ-9mECDS4EC7Ft-EtrzzQhersKGtEx_eZ7qrdYqRLcg" alt=""><figcaption><p>sshd_config in nano text editor </p></figcaption></figure>

I use the arrow keys to scroll down to the authentication section of the file. Next to "PermitRootLogin" is the option "yes". I change it to "no", as seen in the image above. I press "CTRL + o" keys and then enter to save the file. I press "CTRL + x" to exit the file.

## Step 2

I want to make sure the file change was successful, so I attempted to log into dhcp01-luke as root from an SSH session on ad01-luke. I used the correct password, but it still denied me access. &#x20;

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption><p>attempted ssh login as root from ad01-luke powershell </p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (1).png" alt=""><figcaption><p>failed login attempts shown in the logs</p></figcaption></figure>

The image above is on dhcp01-luke. The logs show the failed login attempts to root. It's showing the problem is within the authentication section of the file sshd\_config "_(sshd:auth)_". That's where I made the change to the config file.
