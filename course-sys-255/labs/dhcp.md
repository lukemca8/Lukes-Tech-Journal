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

[DHCP](../technical-terms.md#dhcp) automatically assigns IP addresses, so you don't have to manually assign IP addresses. Machines on a network will be leased addresses after going through a [short process](../technical-terms.md#dhcp-process) with the server. You can understand how crucial DHCP is if you imagine a large network with 100s of machines needing IP addresses. Going through every machine manually would be a big waste of time. DHCP servers are essential in any network environment.

## [Tools](../tools.md)&#x20;

## [Technical Terms](../technical-terms.md)&#x20;

## Objectives&#x20;
