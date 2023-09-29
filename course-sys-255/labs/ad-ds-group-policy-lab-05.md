# AD-DS / Group Policy (Lab 05)

## Course Progression

#### [Lab 01](virtual-firewall-and-windows-10-configuration.md)

* Gained familiarity with the course's lab environment.&#x20;
* Configured my own firewall that separates my local area network from the rest of the class (SYS255-WAN).&#x20;
* Configured a Windows 10 machine to communicate with the internet.&#x20;

#### [Lab 02](windows-server-2019-adds-and-dns.md)&#x20;

* Established my own internal DNS on a Windows Server 2019 in the lab environment&#x20;
* Gained familiarity with Windows Server 2019, and ADDS&#x20;

#### [Lab 03](linux.md)&#x20;

* Gained familiarity with CentOS Linux.&#x20;
* Configured dhcp01-luke to be on my network.
* Created an A and PTR record in my internal DNS for the new CentOS dhcp01-Luke machine.&#x20;
* Established an SSH session as Linux user "luke" from wks01 in PowerShell.
* Experimented with the CentOS Linux directory with bash commands on the SSH session.

#### [Lab 04](dhcp.md)

* Installed and configured DHCP service on dhcp01-luke.

## Discussion

## [Tools](../tools.md)&#x20;

*

## [Technical Terms](../technical-terms.md) &#x20;

*

## Objectives

*

## Deliverable 1

<figure><img src="https://lh6.googleusercontent.com/Spx49alODPpVvANPlaIZLq9hi5vDVoe9Qz8e_qzREmfJJ2zhVoeB062xUUnkPbrIz_vd_Zd3XSM5bdGpazpfzckswMvfCGegK0d8cl6hGL3V7xDlxsD_Iy9jyi1ug0S-6PP-Wr5YYNM4orZzuZBJEVg" alt=""><figcaption><p>Logged into WKS01-Luke as alice. There’s no recycle bin. Power shell is open and shows the results of gpresult /r. This screenshot proves I set up the group policy successfully.</p></figcaption></figure>

## Deliverable 2

<figure><img src="https://lh5.googleusercontent.com/iCLsLgT0bpdyhgTQ_o_5SRjYaqt73Ny6K_Hs46cTxJEeo0yYfe-6AioxzVURXft6MO2VO4U8QgXEtEqG32puGFpfbigxSzUFCNeRaNkwNl_U9b8Kqp6mxB3_74buZSVf2lKPN9qvjQFFPYGQ8HpwY_Q" alt=""><figcaption><p>Logged into WKS01-Luke as -adm AD power account. The elevated Power shell is open and shows the results of gpupdate /force and gpresult /scope computer /r. This screenshot proves I successfully applied the DisableLastLogin to the Domain computers.</p></figcaption></figure>

## Deliverable 3&#x20;

<figure><img src="https://lh5.googleusercontent.com/iSH4cYCzNzXQ5DSUD4H0tZDhzchs4UPAIg7Yif29PWPGjhNv0o6LvBkcsPbT5Nwcl2e3onDxlo2GsHSlE-kp1ERToCtEJedrKcKyCDsfeN_H2nNQ4EOpxZye_v7ut9QC9oPUknxV9ir5bO8AuDlz9vk" alt=""><figcaption><p>This screenshot proves I set up disable last login policy successfully. Theres no evidence of the last logged in user. </p></figcaption></figure>
