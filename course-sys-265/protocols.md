# Protocols

## SNMP

Simple Network Management Protocol&#x20;

usually the least common denominator for network management

Version 1+2 ==not secure

A community string is basically a password, sent in clear text and defaulted to "public", and is used to access read-only resources

Version 3 Supports Encryption, but many legacy devices do not support v3.

### Database Driven&#x20;

#### Three components

Managed device&#x20;

SnMP Service/Agent (Runs on the device)

Network Management System

#### Management Information Base (MIB)

Contains a Hierarchial list of object identifiers (OIDs)&#x20;

SNMP Compliant systems map OIDS to system parameters such that someone can Query the System Location OID on multiple devices and the device will know which data to return.

### Ports and Protocols

#### Example

pfSense supports SNMP

When enabled, it will listen for requests to port 161/UDP.

An external system (typically a management system) will use an SNMP client to query fw01 for SNMP-based information.&#x20;

This is a client -> Server Pull Method.&#x20;

* SNMP Get/Set Requests

### Traps

#### An alternative is to set a condition on the SNMP-enabled device, where when a certain threshold is reached (ex: CPU temperature)&#x20;

* The device Will send an SNMP Trap to a management system listening on UDP/162 for a more proactive response&#x20;
* SNMP Trap/Inform
