---
description: >-
  Objective: Demonstrate understanding of VLAN uses and limitations and simple
  configuration of routing between VLANs
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

# VLANS in Packet Tracer Part 1

## **Goals**:

* Demonstrate the need and impact of  VLANs on networks
* Recognize the distinction between logical and physical switching
* Determine the difference between Trunk and Access ports
* Configure a switch to support multiple VLANs
* Configure switch access ports
* Configure switch trunk ports &#x20;

![](<../../.gitbook/assets/image (2) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1).png>)&#x20;

## Reflection:&#x20;

### How to create VLANS on a switch: &#x20;

1. Click on the switch.&#x20;
2. Click the config tab.
3. Click on the VLAN Database tab on the column to the left.&#x20;
4. In the VLAN Number textbox, enter the number of your choice for your VLAN.&#x20;
5. In the VLAN Name textbox, enter the name of your choice for your VLAN.&#x20;
6. Click Add.

### How to configure an interface as an Acess port:&#x20;

1. Click on the switch.&#x20;
2. Click on the config tab.&#x20;
3. Click on the interface that you want to configure. (ie. fastEthernet0/1)&#x20;
4. Click the drop-down box on the left.&#x20;
5. Click Access.&#x20;
6. Click the VLAN drop-down box on the right.&#x20;
7. Click on the VLAN you want to assign to the interface. (This will assign a certain VLAN to the end device that is connected to the interface you previously selected.)&#x20;

### How to configure an interface as a Trunk port:&#x20;

1. Click on the switch.&#x20;
2. Click on the config tab.&#x20;
3. Click on the interface that you want to configure. (ie. GigabitEthernet0/1)&#x20;
4. Click the drop-down box on the left. &#x20;
5. Click Trunk.&#x20;
6. Click the VLAN drop-down on the right.&#x20;
7. Check all of the VLANS that will be used by the switch.&#x20;

In the lab I did, you had to configure the interfaces GigabitEthernet0/1 and GigabitEthernet0/2 for the switch in the middle of the 3 switches instead of just GigabitEthernet0/1 because it had to be able to communicate between the other 2 switches.
