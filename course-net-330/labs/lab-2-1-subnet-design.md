# Lab 2-1: Subnet Design

## screenshots and notes:

assigned network: 10.8.0.0/16

### Design Addressing:&#x20;

#### Subnet Scheme:

<table data-full-width="true"><thead><tr><th width="93">VLAN</th><th width="137">VLAN_NAME</th><th width="139">Hosts Needed</th><th width="131">Network</th><th width="153">Netmask</th><th width="214">Useable IP range</th><th>Router Address</th></tr></thead><tbody><tr><td>1</td><td>Management</td><td>250</td><td>10.8.10.0/24</td><td>255.255.255.0</td><td>10.8.10.1-10.8.10.254</td><td>10.8.10.1</td></tr><tr><td>100</td><td>FacStaff</td><td>200</td><td>10.8.11.0/24</td><td>255.255.255.0</td><td>10.8.11.1-10.8.11.254</td><td>10.8.11.1</td></tr><tr><td>110</td><td>Student</td><td>450</td><td>10.8.8.0/23</td><td>255.255.254.0</td><td>10.8.8.1-10.8.9.254</td><td>10.8.8.1</td></tr><tr><td>130</td><td>StuLab1</td><td>35</td><td>10.8.12.0/26</td><td>255.255.255.192</td><td>10.8.12.1-10.8.12.62</td><td>10.8.12.1</td></tr><tr><td>140</td><td>StuLab2</td><td>35</td><td>10.8.12.64/26</td><td>255.255.255.192</td><td>10.8.12.65-10.8.12.126</td><td>10.8.12.65</td></tr><tr><td>200</td><td>StuWireless</td><td>900</td><td>10.8.0.0/22</td><td>255.255.252.0</td><td>10.8.0.1-10.8.3.254</td><td>10.8.0.1</td></tr><tr><td>210</td><td>FSWireless</td><td>650</td><td>10.8.4.0/22</td><td>255.255.252.0</td><td>10.8.4.1-10.8.7.254</td><td>10.8.4.1</td></tr></tbody></table>

### Packet Tracer Starter File:&#x20;

<figure><img src="../../.gitbook/assets/image (36).png" alt=""><figcaption></figcaption></figure>

I will apply the subnet scheme to the packet tracer starter file. &#x20;











### **Tech Journal Entry for Lab 2-1 Subnet Design**

* Commands to navigate different modes on a Cisco Switch/Router (enable, config t...) and how you know what mode you are in
* Commands to create VLANS on switch
* Setting access and trunk ports on switch
* Configure interfaces in "ranges"





