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

# Network Connectivity Testing

## Objective

In this lab I test simple network connectivity using common command-line tools.

### `ipconfig` shows the following:

**IPv4 Address:** 192.168.3.141

**Subnet Mask:** 255.255.255.0

**Default Gateway:** 192.168.3.250

### `ipconfig /all` shows the following:

**Physical Address:** 00-0C-29-C8-9C-F8

**DNS servers:** 192.168.4.4 , 192.168.4.5 , 192.168.4.3

<figure><img src="https://lh3.googleusercontent.com/6ipAp0Hpo9cCWomUiFyvlc5R7wt9XbdCXtFrnXN9UVNOTiE3tX6TLAHxNzVChv35N-_5yI5nHpmWJBzZt3-WLyhAMjsB253paaum8VEO8Vnb_tVUyJlFaBtfh1TJCMJhy-X1m4xUQv6bNalXlt-ULkA" alt=""><figcaption><p>Pinging the default gateway sends out 4 packets and receives 4 packets with an average round trip time of 1ms. </p></figcaption></figure>

<figure><img src="https://lh4.googleusercontent.com/AyNms2zy_qUYXaBQa52gLIol5sHeeSoTV4uxPOhM9Rq2_stjc3dUjkpMtVtbipYoQ-218o68JYIdM6M9ybFr8JhYHU0IAzukH2jLPyg1YiOPVp6kz54HOcrzXauA3lJayNSwR1e4nw7BK_9k6B7oqdQ" alt=""><figcaption><p>Pinging <a href="http://www.google.com/">www.google.com</a> sends out 4 packets and receives 4 packets, with an average round trip time of 16ms. </p></figcaption></figure>

Pinging my lab partner's IP address sends out 4 packets and receives 4 packets with an average round trip time of 0ms.

Pinging my lab partner's IP address takes on average 0ms for a round trip, while pinging google takes 16ms.

<figure><img src="https://lh6.googleusercontent.com/ELszcLr_NTM46W9r_LItQ_iaDiF1cYnsIa_25XwoY4s-41RtCY3y_c42_ix8-1_znA10dEqKPfBHpzAW-DyZLgePLD-6j1u0QqrsUuYcwLlxJBD6-0JBSthcoqcPq0FFNY9qlTZCI_-Fzhr5DMFOtLs" alt=""><figcaption><p><code>tracert www.google.com</code></p></figcaption></figure>

Going from my workstation to google.com encountered a total of 14 hops between various routers. Some of the router names include champlain.edu, static.burlingtontelecom.net, and equinix.com.

<figure><img src="https://lh3.googleusercontent.com/hIQTslpXBR6iHC67zO1P36EDGGv2XconONEBhFOYiHzl_L6OtomdMB2owXD6XITxwT3hc-L9uiMwmkTwv63IimBMGs91vSMcLmMOSTKKFI0TV2ISCJFyLPrMLgAmYPsEUIN6NViN42T36tR18vpQ3Uc" alt=""><figcaption><p><code>nslookup</code> followed by websites</p></figcaption></figure>

(nslookup is used for querying the Domain Name System (DNS) to obtain domain name or IP address mapping or for any other specific DNS record.)

Bing.com has 3 IP addresses assigned to itself. Champlain.edu has 1 IP address assigned to itself.
