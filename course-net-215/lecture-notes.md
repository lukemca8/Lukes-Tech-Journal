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





## ARP asks for the mac address of an IP address.&#x20;

## Data link:&#x20;

&#x20;01:4b:cd:00:01:0z - hexadecimal &#x20;

&#x20;MAC address used on your local area network &#x20;

Hardware address changes throughout hops if it goes through routers.&#x20;

## Ip:&#x20;

A.B.C.D  0-255 - 4 bytes. 32 bits. (Binary)

Used to communicate with other networks, not in the LAN.

stays the same address. &#x20;



## Ethernet:&#x20;

Not a cable, it's a communications paradigm/protocol. Its used in Bus, Star, and "star" like topologies.

14 bytes in the ethernet header.&#x20;

6 bytes desitnation address, 6 bytes source address, 2 byte type, 4 byte CRC - checks for errors in the packet.

### Addresses in ehternet header:&#x20;

MAC addresses - 6 bytes - hex ex:  01:4b:cd:00:01:0z&#x20;

First 3 bytes are manuafacturere address

Last 3 bytes identify the unique device. &#x20;



## ARP Order of request:

Is it local or distant

If local, broadcast asks for MAC of the destination IP&#x20;

If distant, it will broadcast asking for the Mac address of the default gateway router &#x20;



&#x20;









&#x20;







&#x20;







