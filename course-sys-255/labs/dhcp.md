# DHCP

## Course Progression

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
* Experimented with the CentOS Linux directory with bash commands on the SSH session.

## Discussion:

[DHCP](../technical-terms.md#dhcp) automatically assigns IP addresses, so you don't have to manually assign IP addresses. Machines on a network will be leased addresses after going through a [short process](../technical-terms.md#dhcp-process) with the server. You can understand how crucial DHCP is if you imagine a large network with 100s of machines needing IP addresses. Going through every machine manually would be a big waste of time. DHCP servers are essential in modern network environments.

## [Tools](../tools.md)&#x20;

## [Technical Terms](../technical-terms.md)&#x20;

## Objectives&#x20;

* Install and configure DHCP service on dhcp01-luke.

## Step 1

I established an SSH session as Linux user Luke from an ad01-luke powershell.&#x20;

I installed the DHCP services using the Yum update manager as an elevated user.&#x20;

<figure><img src="../../.gitbook/assets/image (11).png" alt=""><figcaption><p>Successful install of DHCP service </p></figcaption></figure>

Next, I configured the DHCP service by using the vi text editor.

<figure><img src="../../.gitbook/assets/image (16).png" alt=""><figcaption><p>DHCP config file in vi </p></figcaption></figure>

I start the DHCP service, and I check to make sure it's running properly.

<figure><img src="../../.gitbook/assets/image (13).png" alt=""><figcaption><p>dhcp service running </p></figcaption></figure>

I enable the service to run on bootup&#x20;

<figure><img src="../../.gitbook/assets/image (14).png" alt=""><figcaption><p>systemctl enable dhcpd </p></figcaption></figure>

Next, I add some rules to my firewall regarding the new DHCP service.&#x20;

<figure><img src="../../.gitbook/assets/image (15).png" alt=""><figcaption><p>adding firewall rules</p></figcaption></figure>

For the image above, the top half shows the firewall config before, and the bottom part is after the commands. You can see that "DHCP" was added next to the services field. It now sits alongside "dhcpv6-client" and "ssh", which already came with CentOS.

I then log out of the elevated user, and I end the ssh session.&#x20;

