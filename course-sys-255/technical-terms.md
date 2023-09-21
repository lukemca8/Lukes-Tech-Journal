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

# Technical Terms

## Domain Name System&#x20;

You look up a website in whatever browser you're using. Your OS doesn't know the IP address associated with the website's domain name, so it can't load the page. Luckily, the Domain Name System (DNS) is here to save the day!&#x20;

DNS uses a database hierarchy containing IP addresses and each of their associated domain name.&#x20;

### Common DNS terms:

* Domain controller&#x20;
* DNS
* AD Domain forest
* DNS queries
* DNS Record
* Reverse Lookup Zone
* Forward lookup zones
* Fully Qualified domain name (FQDN)&#x20;
* Domain Administrator&#x20;

### Zone files

Zone files are text files that contain a resource record in plain text and are used to define a zone. A DNS zone is a distinct portion of the domain namespace in the Domain Name System. Usually, these zones are managed by a single delegated Domain Controller. A zone is classified either as a domain name, a domain name with multiple subdomains, or a lot of domain names. DNS zones that are in the [AD DS](tools.md#active-directory-domain-services) Windows program are known as Active Directory-integrated zones. Zone files contain instructions for DNS servers on how to handle requests for your domain, and sometimes list the data of a DNS cache. Usually, zone files are filed under the named working directory (/var/named/).

{% code title="zone file e.g." %}
```
localhost   IN	    A	    127.0.0.1
```
{% endcode %}

#### Records

A resource record (RR) is the main entry in a DNS zone file. Every RR has specific information on objects (variables, a data structure, a function, or a method). This data contains the following fields; domain name, time to live (TTL), address class, record type, and sometimes other fields are included depending on the RR type.&#x20;

Time to live or hop limit restricts how long data can exist in a computer or network. TTL is used as a timestamp or counter that is either connected to or built into the data. In this case, the data is built into a resource record. Data is either removed or revalidated when the event count or timespan has passed.   &#x20;

For typical DNS records including hostnames, servers, or IP addresses, the class of record is IN (internet). For the HS class, which uses MIT/Athena "Hesiod" data, limited support is provided.

| Record Type                   | Use                                                               |
| ----------------------------- | ----------------------------------------------------------------- |
| Address Record (A)            | Resolves a name to an IPv4.                                       |
| Canonical Name Record (CNAME) | Maps one domain name to another.                                  |
| Address Record (AAAA)         | Resolves a name to an IPv6.                                       |
| Pointer Record (PTR)          | Resolves a IPv4 address to a name.                                |
| Mail Exchange (MX)            | Identifies the email servers for a domain.                        |
| Service Locator (SRV)         | Finds SIP servers, Conference servers, and other common services. |

#### DNS Cache

On a computer's operating system or web browser, the term "DNS cache" refers to the temporary storage of data about past DNS lookups. A DNS lookup can be swiftly retrieved by your OS or browser if you keep a local copy of it, which makes it possible to resolve a website's URL to its matching IP much more quickly.&#x20;

DNS caching happens outside of the OS and browser as well. A DNS lookup actually comprises several phases. The resolver, root server, and TLD server are all involved in a new DNS lookup. Information is collected at each stage and stored for further use. The resolver may therefore have a cached copy of the necessary data even if the local DNS cache is empty, preventing the need to perform a full DNS lookup.&#x20;

### DNS Lookup

[https://www.catchpoint.com/blog/domain-name-to-ip-address](https://www.catchpoint.com/blog/domain-name-to-ip-address) (good resource)

### Sources&#x20;

* [https://techdocs.f5.com/kb/en-us/archived\_products/3-dns/manuals/product/3dns4\_5ref/3dns\_resourcerecs.html#1000156](https://techdocs.f5.com/kb/en-us/archived\_products/3-dns/manuals/product/3dns4\_5ref/3dns\_resourcerecs.html#1000156)&#x20;
* [https://learning.mlytics.com/domain-name-system/dns-record-what-is-a-zone-file/#:\~:text=A%20zone%20file%20provides%20information,contents%20of%20a%20DNS%20cache.](https://learning.mlytics.com/domain-name-system/dns-record-what-is-a-zone-file/)&#x20;
* [https://www.keycdn.com/support/dns-cache](https://www.keycdn.com/support/dns-cache) &#x20;

## DHCP

DHCP automatically assigns IP addresses, so you don't have to manually assign IP addresses. Machines on a network will be leased addresses after going through a short process with the server. You can understand how crucial DHCP is if you imagine a large network with 100s of machines needing IP addresses. Going through every machine manually would be a big waste of time. DHCP servers are essential in modern network environments.

### DHCPD

DHCPD is a DHCP service. The D at the end of DHCP stands for daemon. The service runs all of the tasks for the DHCP server.

### DHCP Configuration

### DHCP Lease

When a DHCP assigns an IP address, the server actually gives the machine a set time limit for how long the machine can maintain the address. After the time limit is up, the machine will go through the DHCP process to get another IP address.

When a machine loses its IP address, it will try to get the original address back, called the preferred IP address. The client will ask the DHCP server for its preferred IP address when it renews.

A machine can terminate, or release the leased IP address at any time. In powershell, you can use the command `ipconfig /release`. To engage with the DHCP server again, use the command `ipconfig /renew`. &#x20;

### DHCP Process

In order for a computer to have its IP assigned automatically, the DHCP process is used.

#### DHCPRelease (only happens if the machine previously had an IP in the network)

Releases all of the configs from the previous DHCP leased addresses.

#### DHCPDiscover&#x20;

Looks for a DHCP server by sending a broadcast.&#x20;

#### DHCPOffer&#x20;

The DHCP server responds to this broadcast and offers an address&#x20;

#### DHCPRequest&#x20;

The host requests to lease the address. Once the lease is up, the host will have to do this process over again for a new address. T1 = 50% of the lease; T2 = 87.5% of the lease.

#### DHCPACK&#x20;

DHCP server sends the IP addresses to the host (IPv4, default gateway, DNS server

### Ports used&#x20;

#### UDP Port&#x20;

* Client: Port 68
* Server: Port 67

### Sources&#x20;

* [https://linux.die.net/man/5/dhcpd.conf](https://linux.die.net/man/5/dhcpd.conf)
* [https://www.ibm.com/docs/en/aix/7.2?topic=d-dhcpcd-daemon](https://www.ibm.com/docs/en/aix/7.2?topic=d-dhcpcd-daemon)&#x20;
* [https://linux.die.net/man/8/dhcpd](https://linux.die.net/man/8/dhcpd)&#x20;

## Upstream Gateway&#x20;

An upstream gateway is the last network device until the next network segment in the architecture.

## Bash

Scripting/command language, used in Linux shells.&#x20;

## Wheel&#x20;

In Unix systems, a wheel is a user account with a wheel bit, which designates that user to have special system privileges.&#x20;

A wheel group is a group of wheel users that have access to the sudo command, which grants super user privileges. Wheel groups are seen on mostly Berkeley Software Distribution (BSD) systems.&#x20;

## Tree&#x20;

The tree is a program that provides a depth-indented listing of files from a recursive directory. The tree displays the list of files in the current directory without any arguments.&#x20;

## Network ID

Used to designate a specific network or host, it is usually represented with the beginning part of an IP address.&#x20;

## Daemon

A background process in Linux that runs if the computer/server is on.&#x20;

## UID

User Identification. Used in CentOS Linux. Used to identify different users on an OS. The root user is uid 0. The first user account is uid 1000.&#x20;
