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

# Lecture notes

## Network protocols&#x20;

A network protocol is a set of rules that are implemented onto the internet and enable easier and smoother communication between users and devices.&#x20;



A protocol suite is a set of protocols designed to work together&#x20;

ex: TCP/IP, industrial controls/SCADA, ZigBee, Bluetooth, Cellular (2G, 3G, LTE)&#x20;

## Data link:&#x20;

&#x20;01:4b:cd:00:01:0z - hexadecimal &#x20;

&#x20;MAC address used on your local area network &#x20;

Hardware address changes throughout hops if it goes through routers.&#x20;

## Ip:&#x20;

A.B.C.D  0-255 - 4 bytes. 32 bits. (Binary)

Used to communicate with other networks, not in the LAN.

stays the same address. &#x20;



## Ethernet:&#x20;

Not a cable, it's a communications paradigm/protocol. It's used in Bus, Star, and "star" like topologies.

14 bytes in the ethernet header.&#x20;

6 bytes destination address, 6 bytes source address, 2 byte type, 4 byte CRC - checks for errors in the packet.

### Addresses in ethernet header:&#x20;

MAC addresses - 6 bytes - hex ex:  01:4b:cd:00:01:0z&#x20;

The first 3 bytes are manufacturer's address

The last 3 bytes identify the unique device. &#x20;

## ARP

Asks for the Mac address of an IP address.&#x20;

### ARP Order of request:

Is it local or distant

If local, the broadcast asks for the MAC of the destination IP&#x20;

If distant, it will broadcast asking for the Mac address of the default gateway router&#x20;

The ARP response packet is 60 bytes, ARP request packet is 42 bytes. &#x20;

ARP slows down the network because every device on the LAN must use a CPU to check if it can send a response. So the caching system is introduced. &#x20;

ARP cache in memory on most operating systems. The command `arp -a` is used to view the table of contents. Sees IP and matching MAC address.&#x20;

### ARP spoofing:

Linking of an attacker's MAC address with the IP address of a legitimate computer or server on the network. The attacker's MAC address will begin receiving data intended for that IP address.

ARP spoofing results in the following: denial of service attacks, session hijacking, and man-in-the-middle attacks. All of these attacks are on LAN.&#x20;

### MITMA utilizing ARP:

Respond to every ARP request to router with the MITM MAC address instead, so the other computers on the LAN think you're the router. It's possible the router will respond to the request before the MITM. Then you can inspect packets from everyone using the LAN.

Man in the middle attack: Convinced all the people out there you're the router, and all of the packets coming from the LAN go to you.

VPN creates a tunnel through the man in the middle to the actual router.&#x20;

### Protection against ARP spoofing

#### Layer 2 switches

Use a table of Mac addresses to physical port mappings

Many switches include features to protect against ARP spoofing.&#x20;

#### Static mappings

A Static mapping associates an IP address to a MAC address on a specific port.&#x20;

The switch will not allow the MAC to be used on other ports. &#x20;

&#x20;









&#x20;







&#x20;







