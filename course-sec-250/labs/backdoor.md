---
layout: editorial
---

# Backdoor

## **Backdoor Lab**

### Objective:

Understand how APT allows access into a corporate network.&#x20;

#### Summary:&#x20;

Bob is the Victim and Eve is the attacker. Two systems communicate with each other on an arbitrary port (No firewall or device preventing communication). &#x20;

#### Submissions:&#x20;

Bob Screenshot: Bob sets up a listener for any connections on port 8001. Eve connects to port 8001 and is now on Bob’s host.

![](https://lh5.googleusercontent.com/FPvYn\_WUcEAeCG0PR4Li-P9ndUYIrmAoMKNkUA7uD\_c69qDrytzcx3N5xokAHP\_4C4Oec8GBBDf\_i-hFyBlcDKnRgfWCOXxSbgEKrxhT2zQOknI6Sp5rTZV4XIoX8tfhxwRbZBL7jCoIvy0iAuN8L4M)

Bob Screenshot: Eve plants a .txt on the host, and puts “password is 1337” as the text for the file. Bob views the file contents by using the cat command.

![](https://lh6.googleusercontent.com/dslFke1oTILpe\_5A6\_WNBPyrRgztbO22Cdpsgv3HpoQP8NJFuU5sVt4pKqaP5wyTNacA4Yu2GyWYs1pYvyaOUgykrxzJ2objQeoHNK6n3FYFTB5zb2PyGkC8kAZkrE4LNlkKbEVqdO-fUQnP1pysby8)  &#x20;

Eve Screenshot: Eve connects to Bob’s computer through port 8001.

![](https://lh5.googleusercontent.com/Y\_c04tQ44L2rYkifT3roMe6Zn-rBSSh4V-jBSL7TNlPdGhAoBtcOH30507U0e92\_91HuOpykpqiNs\_9vAm90AUx6QpCORlTclK7jBgn-eSsftZpVSRRtkDkJIWCo8GyMjN1OWe0OPzaMBH5fvdL9Un8)     &#x20;

Eve Screenshot: Eve plants a .txt on the host, and puts “password is 1337” as the text for the file. &#x20;

![](https://lh5.googleusercontent.com/ROr2j4QOW\_aAMRAZK6i8EYO33-wwI1AS7aNIjwDNwmuaTRWE5TvKz5iJL0hzrP\_pfHywTUF\_wtFrK3FtNlrEgOcV7On8uUXM7LKKUgUSVVfYbWikIUH8xNGmm3T4ReB5FnGww-PuG6g-oqA0FubZL7E)

\
