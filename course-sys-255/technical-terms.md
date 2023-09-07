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

# Technical Terms

## Upstream Gateway&#x20;

An upstream gateway is the last network device until the next network segment in the architecture.

## Domain Name System&#x20;

You look up a website in whatever browser you're using. Your OS doesn't know the IP address associated with the website's domain name, so it can't load the page. Luckily, the Domain Name System (DNS) is here to save the day!&#x20;

DNS uses a database hierarchy containing IP addresses and each of their associated domain name.&#x20;

### Zone files

Zone files are text files that contain a resource record in plain text and are used to define a zone. A DNS zone is a distinct portion of the domain namespace in the Domain Name System. Usually, these zones are managed by a single delegated Domain Controller. A zone is classified either as a domain name, a domain name with multiple subdomains, or a lot of domain names. DNS zones that are in the [AD DS](tools.md#active-directory-domain-services) Windows program are known as Active Directory-integrated zones. Zone files contain instructions for DNS servers on how to handle requests for your domain, and sometimes list the data of a DNS cache. Usually, zone files are filed under the named working directory (/var/named/).

### Records

A resource record (RR) is the main entry in a DNS zone file. Every RR has specific information on objects (variables, a data structure, a function, or a method). This data contains the following fields; domain name, time to live (TTL), address class, record type, and sometimes other fields are included depending on the RR type.&#x20;

#### Time to Live

Time to live or hop limit restricts how long data can exist in a computer or network. TTL is used as a timestamp or counter that is either connected to or built into the data. In this case, the data is built into a resource record. Data is either removed or revalidated when the event count or timespan has passed.   &#x20;

#### Class

For typical DNS records including hostnames, servers, or IP addresses, the class of record is IN (internet). For the HS class, which uses MIT/Athena "Hesiod" data, limited support is provided.

| Record Type                   | Use                                                               |
| ----------------------------- | ----------------------------------------------------------------- |
| Address Record (A)            | Resolves a name to an IPv4.                                       |
| Canonical Name Record (CNAME) | Maps one domain name to another.                                  |
| Address Record (AAAA)         | Resolves a name to an IPv6.                                       |
| Pointer Record (PTR)          | Resolves a IPv4 address to a name.                                |
| Mail Exchange (MX)            | Identifies the email servers for a domain.                        |
| Service Locator (SRV)         | Finds SIP servers, Conference servers, and other common services. |

{% code title="zone file e.g." %}
```
localhost   IN	    A	    127.0.0.1
```
{% endcode %}

* [https://techdocs.f5.com/kb/en-us/archived\_products/3-dns/manuals/product/3dns4\_5ref/3dns\_resourcerecs.html#1000156](https://techdocs.f5.com/kb/en-us/archived\_products/3-dns/manuals/product/3dns4\_5ref/3dns\_resourcerecs.html#1000156)

