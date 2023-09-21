# DHCP (Lab 04)

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

## Discussion

[DHCP](../technical-terms.md#dhcp) automatically assigns IP addresses, so you don't have to manually assign IP addresses. Machines on a network will be leased addresses after going through a [short process](../technical-terms.md#dhcp-process) with the server. You can understand how crucial DHCP is if you imagine a large network with 100s of machines needing IP addresses. Going through every machine manually would be a big waste of time. DHCP servers are essential in modern network environments.

## [Tools](../tools.md)&#x20;

## [Technical Terms](../technical-terms.md) &#x20;

* DHCP&#x20;
* DHCP lease

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

I then log out of the elevated user, and I end the ssh session. &#x20;

## Step 2

I log into wks01-luke as domain admin "luke.mckay-adm" and change the IPv4 properties to obtain an IP address automatically. This will force the workstation to engage with the DHCP service. So now the workstation doesn't have a static IP address.

<figure><img src="../../.gitbook/assets/image (7).png" alt=""><figcaption><p>re-configuring IPv4 properties on wks01-luke</p></figcaption></figure>

After setting my IPv4 to dynamic addressing, I see if my DHCP service is running properly on the network by running an ipconfig /all in PowerShell.&#x20;

### Deliverable 1

<figure><img src="../../.gitbook/assets/image (1) (1) (1) (1).png" alt=""><figcaption><p>DHCP connectivity test</p></figcaption></figure>

The above image shows that my new DHCP Server has been acknowledged by wks01-luke.&#x20;

## Step 3

I log back into dhcp01-luke by establishing an SSH session as Linux user Luke from an ad01-luke powershell. I check the DHCP log for wks01-Luke's request for DHCP information.&#x20;

### Deliverable 2

<figure><img src="../../.gitbook/assets/image (2) (1) (1) (1).png" alt=""><figcaption><p>dhcpd logs </p></figcaption></figure>

In the image above, we can see that the DHCP server offers wks01-Luke the IP address 10.0.5.100.

On the next line, wks01-Luke requests the IP address offered to it, basically saying, "Yeah, I'll take the IP address offered to me!"&#x20;

The final line in the log is the DHCP server acknowledging that wks01-Luke accepted the IP address and the IP 10.0.5.100 is leased.

The DHCP server knows not to offer the leased IP address until the lease is over.

`|` is a pipe command. Pipes send the output of the command before it to the next command.&#x20;

`grep` Searches for a specified string of characters inside of files.&#x20;

## Step 4

Now logged into wks01-Luke, I release the leased DHCP address that was given to me by using the command `ipconfig /release`. Next, I ask for a new IP address from the DHCP server by using the command `ipconfig /renew`. This engages wks01-Luke and dhcp01-luke in the DHCP leasing process.

<figure><img src="../../.gitbook/assets/image (17).png" alt=""><figcaption><p>renewing IP address</p></figcaption></figure>

While this is happening, I have a Wireshark capture running so I can analyze the DHCP leasing process.&#x20;

### Deliverable 3&#x20;

<figure><img src="../../.gitbook/assets/image (18).png" alt=""><figcaption><p>DHCP release and leasing process observed in Wireshark.</p></figcaption></figure>

The image above shows packets being sent back and forth between wks01-Luke and dhcp01-luke. There are 5 packets in total.&#x20;

The first packet came from the `ipconfig /release` command shown in the previous image. Wks01-Luke is telling the DHCP server that its IP address isn't needed anymore, so the DHCP server releases the IP config for wks01-Luke from its database. This allows the DHCP server to assign the 10.0.5.100 IP to a device once again.

The last 4 packets are a result of the command `ipconfig /renew` shown in the previous image. These packets are the DHCP leasing process.

## Step 5

I want to figure out how to set the lease time on a leased IP address. At this point, the DHCP service's leasing time is the default, and I want to change it to 1 hour, with a max of 4 hours.&#x20;

### Deliverable 4

<figure><img src="../../.gitbook/assets/image (20).png" alt=""><figcaption><p>the new dhcpd config</p></figcaption></figure>

The image above is the output of the command `cat /etc/dhcp/dhcpd.conf`. This command concatenates the file dhcpd.conf. The `default-lease-time` is the average time the DHCPD hands out when giving a client an IP.

<figure><img src="../../.gitbook/assets/image (19).png" alt=""><figcaption><p>releasing and renweing the lease to confirm the new lease time. </p></figcaption></figure>

The image above is a packet from the DHCP lease process after the new default-lease-time of 3600s was written to the dhcpd.conf file. This confirms the configuration file was successfully updated with the new lease time.

## Reflection
