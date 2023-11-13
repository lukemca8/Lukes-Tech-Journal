# MAC OUI and MAC Spoofing

## Discussion

MAC spoofing.

## Objectives&#x20;

* Learn about MAC spoofing
* Gain familiarity with MAC Changer tool in Kali Linux
* Spoof a MAC address that is maintained over the internet.

## Step 1

I make note of my default gateway

<figure><img src="../../.gitbook/assets/image (2) (1) (1).png" alt=""><figcaption><p>ipconfig</p></figcaption></figure>

## Step 2

I start a Wireshark capture and ping the default gateway.&#x20;

<figure><img src="../../.gitbook/assets/image (1) (1) (1) (1) (1).png" alt=""><figcaption><p>ping/Wireshark capture</p></figcaption></figure>

I analyze the packets for the default gateway's MAC address. I find it under the first packet as the destination address (d0:81:c5:23:bd:80).

## Step 3

I go to [https://www.wireshark.org/tools/oui-lookup.html](https://www.wireshark.org/tools/oui-lookup.html) and enter the default gateway's MAC address into the OUI search.&#x20;

<figure><img src="../../.gitbook/assets/image (2) (1) (1) (1).png" alt=""><figcaption><p>default gateway OUI search</p></figcaption></figure>

The result is "D0:81:C5 Juniper Networks". "D0:81:C5" is the OUI. "Juniper Networks" is the vendor of the router (default gateway).&#x20;

## Step 4&#x20;

I log into my Kali VM and with a terminal, I look at all of the options for the MAC Changer tool.&#x20;

<figure><img src="../../.gitbook/assets/image (3).png" alt=""><figcaption><p><code>macchanger --help</code></p></figcaption></figure>

Next after reviewing the tool's syntax, I type `macchanger -s eth0`. This command brings up the current MAC address of the machine's network adapter eth0 (ethernet).

## Step 5

Next, I go to [https://www.wireshark.org/download/automated/data/manuf](https://www.wireshark.org/download/automated/data/manuf) and pick the OUI for Atari (00:00:36). I'm going to spoof my current MAC address with this. The serial number part of the MAC address is going to be de:fa:ce.

<figure><img src="../../.gitbook/assets/image (4).png" alt=""><figcaption><p>spoofing my MAC address</p></figcaption></figure>

Using the command `sudo mcchanger -m 00:00:36:de:fa:ce eth0`, I spoofed my MAC address to 00:00:36:de:fa:ce. It has the vendor as Atari Corporation because I used the Atari OUI (00:00:36).

## Step 6&#x20;

To test the spoofed MAC address, I capture a ping in Wireshark.

<figure><img src="../../.gitbook/assets/image (5).png" alt=""><figcaption><p>Wireshark capture</p></figcaption></figure>

I pinged Google's DNS server from the Kali VM with the spoofed MAC address. As you can see in the image above, the source MAC address is 00:00:36:de:fa:ce, so the spoof is successful.
