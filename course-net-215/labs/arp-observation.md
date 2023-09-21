# ARP Observation

## Discussion&#x20;

ARP (Address Resolution Protocol) sends a broadcast with an IP that asks every device on a LAN for a Mac address that corresponds to the broadcasted IP address.&#x20;

## Objectives&#x20;

* Observe ARP operations
* Understand how ARP is used
* Gain familiarity with ARP requests and replies

## Step 1

I log into my Kali Linux virtual machine. I open a terminal and enter the command `ip route`. I make note of my default gateway: 192.168.3.250

<figure><img src="../../.gitbook/assets/image (3) (1).png" alt=""><figcaption><p>ip route</p></figcaption></figure>

I then enter the command `sudo ip neigh flush all`. Sudo elevates my user privileges, and the rest of the command erases any saved ARP results from my cache.

## Step 2

I open Wireshark in Kali and capture the results of pinging the course instructor's workstation (192.168.3.100). In the Wireshark capture, I can see two ARP packets relating to my ping.

<figure><img src="../../.gitbook/assets/image (5) (1).png" alt=""><figcaption><p>wireshark capture</p></figcaption></figure>

The image above is the first packet. It is the ARP request. My machine is broadcasting a request for the MAC address of IP 192.168.3.100 to all other machines in the network. The exact message is "Who has 192.168.3.100? Tell 192.168.3.29". &#x20;

<figure><img src="../../.gitbook/assets/image (6) (1).png" alt=""><figcaption><p>wireshark capture</p></figcaption></figure>

The image above is the second packet. It is the ARP reply. The instructor's machine is responding to my broadcast, acknowledging that it has that IP address, so it responds with its MAC address. The exact message is "192.168.3.100 is at 48:21:0b:33:74:f7".

## Step 3

I flush the ARP cache again with the same command as before. I'm setting up for one more wireshark capture. I ping 8.8.8.8 (google's DNS server) while a wireshark capture is going. In the Wireshark capture, I can see 2 ARP packets relating to my ping.&#x20;

<figure><img src="../../.gitbook/assets/image (6).png" alt=""><figcaption><p>wireshark capture 2</p></figcaption></figure>

The image above is the first packet. It is the ARP request. After pinging 8.8.8.8, my machine is broadcasting a request for the MAC address of IP 192.168.3.250 to all other machines in the network. The exact message is "Who has 192.168.3.250? Tell 192.168.3.29".

<figure><img src="../../.gitbook/assets/image (1) (1) (1).png" alt=""><figcaption><p>wireshark capture v2 </p></figcaption></figure>

The image above is the second packet. It is the ARP reply. The default gateway (192.168.3.250) is responding to my broadcast with its MAC address (d0:81:c5:23:bd:80). The exact message is "192.168.3.250 is at d0:81:c5:23:bd:80".&#x20;

Since ARP only works throughout local networks, Google's DNS server never receives the broadcast, only the pings sent earlier. The closest network device to Google's DNS server is the default gateway, so the default gateway replies.
