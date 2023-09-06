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

# RIP

## Objective:&#x20;

This Packet Tracer lab has been provided to help you gain a better understanding of how to configure and troubleshoot RIP version 2 in this lab we will configure a basic lab topology, enable RIPv2 on the routers and configure them to advertise their networks.

## Submissions:

### Show IP Route command:&#x20;

R2:&#x20;

![](https://lh5.googleusercontent.com/DslQ95OAuScAG7MGkzwotK5aP8NRr4Pv7B35-82AUBCcFnBaDn37pK2RZFPJMuVbdBQXMjlKVBIFLOgIibHk6FlmA2UDClBy7BJDRtN9NpOr1Z6xJR2pxIMF762KHGlNeMFARzg7RWmhSQtsYLL\_C2E) \


R1:&#x20;

![](https://lh3.googleusercontent.com/dLgcflM\_XPEQuQIGS6o99IoKuNGsI7lpioFsKY9PoHXPDHBCVklMscVc6vmRkZEyEb4pHdRIcNBPcNZb1RPV3\_yjuM1BfhiWC\_OnA9e8GxpA3HefeTkNBoJh9s5KeKbFr5uT5YWdjbFKoUcaaA-wDkA)\


R3:&#x20;

![](https://lh6.googleusercontent.com/-1mbMzWCRzgIggjiqBmuB\_lpYrHHkTcXIZshZTjsqQltrLZh9avEuXq\_7DcldmAj0kwlP3gkeykzex5xGspx6NVSz6sb6fZENlujJrVzOTRZPAD7szZ5b6696Eic9tK03WanH8zRDMJV-xBjmdWHrXQ)\
\


### PDU Details tab:&#x20;

R1 to R2:

![](https://lh5.googleusercontent.com/ktNf-nb3CoRpI0N8SzpIT4pRZMcTG\_MSj7jCB6CNKr9sqdotsRh7D5zPhZ5fDryMjgf-NhSumoYvr5b91APC4JdJtxwXH3CxoSTzOWicoR54FKLM1lRBMfoE3jp24XrGQk1A5RJ2ZU6U43JnaGthL8I)&#x20;

\


Describe what is included in the packet details for the RIP v2 protocol section:&#x20;

For some reason, there is no “Rip v2” section. There are only RIP v1 and 3 Rip Route Packets that follow it. It shows as RIP v2 in the event list though. In the shown sections, you can see the Network address for where the packet comes from, the next HOP, where the pocket is going next, and the Metric which is the hop count. &#x20;

\


R3 to R1:&#x20;

![](https://lh4.googleusercontent.com/xQiQB6zyBVwG23YAJgYtN13PmeedQmrM7SXA8dzO15N5alJUU1DeWibWby9ES55mFJCMX2fxiSykIna\_QI5x3I7HWYK2LmKhWYkbKIvgZrzeXrwVylQ915qv899AJxUDTVNllpHgl67MPGfgP4QDle4)&#x20;

Describe what is included in the packet details for the RIP v2 protocol section:&#x20;

For some reason, there is no “Rip v2” section. There is only a RIP v1 and 1 Rip Route Packet that follows it. It shows as RIP v2 in the event list though. In the shown sections, you can see the Network address for where the packet comes from, the next HOP, where the pocket is going next, and the Metric which is the hop count.&#x20;

## Reflection:

### To configure RIPv2 on Cisco Packet Tracer:

1. Configuring RIP involves&#x20;
   * Enabling it on the router
   * and, declaring which of the directly connected networks should be advertised
2. Here is the configuration for R2 in our example:

* Click on the router, and go to the CLI tab.&#x20;
* Type `enable` command, type `configure terminal` command
* From the "config" mode type:
  * ```
    router rip
    ```
* This will now put you in "router config mode"
* Then specify the version with
  * ```
    version 2
    ```
* And then specify the networks directly connected to Router 2
  * ```
    network 192.168.30.0
    ```
  * ```
    network 10.10.20.0
    ```
* Thats it!
