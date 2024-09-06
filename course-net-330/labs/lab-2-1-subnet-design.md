# Lab 2-1: Subnet Design

## screenshots and notes:

assigned network: 10.8.0.0/16

### Design Addressing:&#x20;

#### Subnet Scheme:

<table data-full-width="true"><thead><tr><th width="93">VLAN</th><th width="137">VLAN_NAME</th><th width="139">Hosts Needed</th><th width="131">Network</th><th width="153">Netmask</th><th width="214">Useable IP range</th><th>Router Address</th></tr></thead><tbody><tr><td>1</td><td>Management</td><td>250</td><td>10.8.10.0/24</td><td>255.255.255.0</td><td>10.8.10.1-10.8.10.254</td><td>10.8.10.1</td></tr><tr><td>100</td><td>FacStaff</td><td>200</td><td>10.8.11.0/24</td><td>255.255.255.0</td><td>10.8.11.1-10.8.11.254</td><td>10.8.11.1</td></tr><tr><td>110</td><td>Student</td><td>450</td><td>10.8.8.0/23</td><td>255.255.254.0</td><td>10.8.8.1-10.8.9.254</td><td>10.8.8.1</td></tr><tr><td>130</td><td>StuLab1</td><td>35</td><td>10.8.12.0/26</td><td>255.255.255.192</td><td>10.8.12.1-10.8.12.62</td><td>10.8.12.1</td></tr><tr><td>140</td><td>StuLab2</td><td>35</td><td>10.8.12.64/26</td><td>255.255.255.192</td><td>10.8.12.65-10.8.12.126</td><td>10.8.12.65</td></tr><tr><td>200</td><td>StuWireless</td><td>900</td><td>10.8.0.0/22</td><td>255.255.252.0</td><td>10.8.0.1-10.8.3.254</td><td>10.8.0.1</td></tr><tr><td>210</td><td>FSWireless</td><td>650</td><td>10.8.4.0/22</td><td>255.255.252.0</td><td>10.8.4.1-10.8.7.254</td><td>10.8.4.1</td></tr></tbody></table>

### Packet Tracer Starter File:&#x20;

<figure><img src="../../.gitbook/assets/image (36).png" alt=""><figcaption></figcaption></figure>

I will apply the subnet scheme to the packet tracer starter file. &#x20;



### **Configure Edge Switches**

* **Add vlans to the vlan database**
  * **100 and 110 to all**
  * **130 (Lab1) in East-02 switch only**
  * **140 (Lab2) in West-02 switch only**
* **All edge switches assigned VLAN 100 (FacStaff) on ports 4-12**&#x20;
* **All edge switches assigned VLAN 110 (Student) on ports 13-20**
* **East-Edge-02 assigned VLAN 130 (Lab1) on ports 21-24**
* **West-Edge-02 assigned VLAN 140 (Lab2) on ports 21-24**

#### **Useful Commands:**

<pre><code><strong>(config)interface range FastEthernet 0/x-y (lets you configure multiple ports at one time)
</strong><strong>(config-if-range)switchport access vlan x (defines the vlan for all ports in the range)
</strong><strong>(any)do copy run start (the active config (running-config) is saved to the startup config (startup-config), and will run on a reboot.)
</strong></code></pre>

### **Configure End User Devices**

* **Assign FacStaff PC's IP's from VLAN 100 (make sure netmask and gateway are correct)**
* **Assign Student PC's IP's from VLAN 110**
* **Assign Lab PC's appropriate IP's**

I did the above steps manually. I clicked on each pc's fastEthernet0 interface config and set the IP according to the VLAN IP range. I also set the netmask under the same tab. I then assigned the default gateway within the Global settings config.  I based the default gateway on the first possible IP for each VLAN.

#### FacStaff PC IP's:

_VLAN 100_

Default Gateway and Netmask: 10.8.11.1 , 255.255.255.0

01= 10.8.11.2 , 02= 10.8.11.3 , 03= 10.8.11.4 , 04= 10.8.11.5 , 05= 10.8.11.6 , 06= 10.8.11.7

#### Student PC IP's:

_VLAN 110_

Default Gateway and Netmask: 10.8.8.1 , 255.255.254.0

01= 10.8.8.2 , 02= 10.8.8.3 , 03= 10.8.8.4 , 04= 10.8.8.5 , 05= 10.8.8.6 , 06= 10.8.8.7

#### East Lab PC IP's:

_VLAN 130_

Default Gateway and Netmask: 10.8.12.1 , 255.255.255.192

01= 10.8.12.2 , 02= 10.8.12.3

#### West Lab PC IP's:

_VLAN 140_

Default Gateway and Netmask: 10.8.12.65 , 255.255.255.192

01= 10.8.12.66

**Connect Devices to Edge Switch**

* **Connect devices with Copper to appropriate ports:**
  * **VLAN 100 (FacStaff) on ports 4-12**
  * **VLAN 110 (Student) on ports 13-20**
  * **VLAN 130 (Lab1) on ports 21-24**
  * **VLAN 140 (Lab2) on ports 21-24**

<figure><img src="../../.gitbook/assets/image (38).png" alt=""><figcaption></figcaption></figure>

The image above displays every end device's FastEthernet0 port connected to its assigned switch port, based on the VLAN the device is in.

**Verification that Step 1 is complete:**

* **Ping devices on same vlan and same switch**
* **Not able to ping different vlans or different switch**

<figure><img src="../../.gitbook/assets/image (40).png" alt=""><figcaption></figcaption></figure>

I ping FacStaff-02 (10.8.11.3) from FacStaff-01 (10.8.11.2). FacStaff-02 replies, indicating a successful connection between devices on the same VLAN on the same switch.

I ping Student-01 (10.8.8.3) from FacStaff-01. The request times out, indicating a failed connection between devices on different VLANs on the same switch.

I ping FacStaff-05 (10.8.11.6) from FacStaff-01. The request times out, indicating a failed connection between devices on the same VLAN, but a different switch.&#x20;

### **Configure Trunking**

#### **Configure trunk ports for Core switches**

* **Add vlans 100, 110, 130, and 140 to the vlan database on Core Switches**
* **Configure FastEthernet 0/1 and 0/2 as trunk ports for the appropriate vlans**

I encountered a command rejected response while configuring trunk ports for East-Core-Switch-01 from the CIOS CLI when entering the command `switchport mode trunk`:

"Command rejected: An interface whose trunk encapsulation is 'Auto' can not be configured to 'trunk' mode."

To solve this issue, I enter the command `switchport trunk encapsulation dot1q` before the `switchport mode trunk` command. After selecting the interface

#### Why This Fix Works:

1. **Trunk Encapsulation**: There are two main encapsulation protocols for trunking:
   * **ISL (Inter-Switch Link)**: Cisco proprietary protocol (less commonly used today).
   * **802.1Q**: The IEEE standard for VLAN tagging, used more widely because it's vendor-neutral.
2. **"Auto" Encapsulation**: When set to "auto," the switch won't allow you to force the interface into trunk mode until it negotiates the encapsulation. By explicitly setting the encapsulation to **802.1Q**, you're overriding the "auto" setting and telling the switch exactly how to handle VLAN tagging on that trunk port.
3. **Switching to Trunk Mode**: Once encapsulation is set, you can safely configure the interface as a trunk. The encapsulation must be specified first, so the switch knows how to process and tag the VLAN traffic.

<figure><img src="../../.gitbook/assets/image (41).png" alt=""><figcaption></figcaption></figure>

#### **Configure trunk ports for Edge switches**

* **Configure FastEthernet 0/1 as trunk port for the appropriate vlans**

I did the commands as seen in the above image, but I didn't need to enter the encapsulation command.

Next, I connected the core switches to the edge switches with a cross-over cable:&#x20;

<figure><img src="../../.gitbook/assets/image (42).png" alt=""><figcaption></figcaption></figure>

**Verification:**

&#x20;You should now be able to ping between two systems on the same VLAN on different switches:

<figure><img src="../../.gitbook/assets/image (43).png" alt=""><figcaption></figcaption></figure>

**I** ping FacStaff-04 from FacStaff-01. FacStaff-04 replies, indicating a successful connection between two devices on the same VLAN, but a different switch.

### **4. Enable Routing**

* **The Core Switches are multi-layer and can route**
* **We will use the EAST-Core Switch as the Router**



* **Enable routing on the the East-Core Switch**
* **Assign the router addresses from the table in step 1 to:**
  * **VLANs 100,110,130, 140 to East-Core**

<pre><code><strong>(config)ip routing (turns on routing on multilayer switches)
</strong><strong>(config)interface vlan 100 (brings you into vlan interface config mode)
</strong><strong>(config-if)ip address 10.8.11.1 255.255.255.0 (set the ip address of 10.8.11.1 for vlan 100 on a routing switch)
</strong><strong>NOTE: This only needs to be set on the router-switch acting as the gateway for the vlan
</strong></code></pre>

<figure><img src="../../.gitbook/assets/image (44).png" alt=""><figcaption></figcaption></figure>

**This command sequence turns the VLAN 130 interface on East-Core-Switch-01 into a default gateway for VLAN 130 devices.**&#x20;

**Verification:**&#x20;

**You should now be able to ping between two systems on different VLANs in EAST:**

<figure><img src="../../.gitbook/assets/image (45).png" alt=""><figcaption></figcaption></figure>

I pinged Lab1-01 (10.8.12.2) from FacStaff-01. Lab1-01 replies, indicating a successful connection between two devices on different VLANs in the East.

**5.  Configure East-West Trunk**

* **Configure Gigabit Ethernet 0/1 on both East and West core switches as trunk ports for defined vlans:**

<figure><img src="../../.gitbook/assets/image (46).png" alt=""><figcaption></figcaption></figure>

* **Copper "cross-over" connector to connect those trunk ports**



**Verification: You should be able to ping between all devices:**

<figure><img src="../../.gitbook/assets/image (47).png" alt=""><figcaption></figcaption></figure>

I pinged Lab2-01 (10.8.12.66) from FacStaff-01. Lab2-01 replies, indicating a successful connection between two devices in a different VLAN, on a different switch, on the West side.

**Small-scale School Network:**

<figure><img src="../../.gitbook/assets/image (48).png" alt=""><figcaption><p>Simulated School Network </p></figcaption></figure>

### **Tech Journal Entry for Lab 2-1 Subnet Design**

* Commands to navigate different modes on a Cisco Switch/Router (enable, config t...) and how you know what mode you are in
* Commands to create VLANS on switch
* Setting access and trunk ports on switch
* Configure interfaces in "ranges"





