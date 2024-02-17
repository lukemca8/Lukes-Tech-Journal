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

# Tools

## Wireshark&#x20;

Analyze live or previously saved network traffic.....PLACEHOLDER&#x20;

<figure><img src="../.gitbook/assets/image (2) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption><p>Live network traffic on Champlain WiFi captured by Wireshark's application. </p></figcaption></figure>

## Cisco Packet Tracer&#x20;

Used to build and simulate networks........PLACEHOLDER&#x20;

<figure><img src="../.gitbook/assets/image (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption><p>A simple simulation of a network using a VLAN  </p></figcaption></figure>

## Binary table

<figure><img src="../.gitbook/assets/image (33).png" alt=""><figcaption><p>Helps convert decimal to binary. Also helps with calculating CIDR.</p></figcaption></figure>

## Traceroute

Maps the hops in a path to a destination.

A ping request is sent to the destination server with a TTL of 1. Once the packet reaches the first hop, the TTL will drop to 0. Since the TTL is now exceeded, the router at the first hop will send back a TTL exceeded, with its IP address in the packet.

The next request will send a ping with a TTL of 2. This will go to the second hop, and then the router at the second hop will send back a TTL exceeded, with its IP address in the packet.

The process continues until the TTL reaches the final hop count. At this point, Windows has the IP for each router in the path to the final destination because of the TTL exceeded packets.
