# Lab 1-1: Simple Network Hardware

Screenshots and notes:&#x20;

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

### FastEthernet Lab Commands:&#x20;

| Section             | Command                               | What Occurs:                                                    |
| ------------------- | ------------------------------------- | --------------------------------------------------------------- |
| Router #            | enable                                | This command enables the router                                 |
| Router #            | Conf t                                | This command entered the config menu                            |
| Router(config) #    | interface fastethernet 0/0            | Use the fastethernet 0/0 port connection                        |
| Router(config-if) # | Ip address 192.168.3.1 255.255.255.0  | Set the fastethernet 0/0 ip to 192.168.3.1/24                   |
| Router(config-if) # | No shutdown                           | Keep fastethernet 0/0 up no matter what                         |
| Router (config-if)# | exit                                  | Exit fastethernet 0/0                                           |
| Router(config) #    | interface fastethernet 0/1            | Use the fastethernet 0/1 port connection                        |
| Router(config-if) # | #ip address 192.168.1.1 255.255.255.0 | Set the fastethernet 0/1 ip to 192.168.1.1/24                   |
| Router(config-if) # | No shutdown                           | Keep fastethernet 0/1 up no matter what                         |
| Router (config-if)# | exit                                  | Exit fastethernet 0/1                                           |
| Router(config) #    | exit                                  | Exit the config menu                                            |
| Router#             | show ip int                           | This shows the interface including the IP address spaces leased |
| Router#             | show ip interface                     | This shows the interface including the IP address spaces leased |
| Router#             | copy run start                        | This saves the status of the router                             |

Deliverables:

Deliverable 1: Set the IP space of device 1 to 192.168.3.5 and device 2 to 192.168.1.5 and attempt to ping 1.5 from 3.5 through the router connection.

![](https://lh7-rt.googleusercontent.com/docsz/AD\_4nXdw8xbzeobP9jm-BCPZFqAnNRhXAGxHjwU0yMVhnoLiJ7qA0Zsu5XDhlK1ufg5\_3AtKNKNuVSJXqgNCtvDsm5Q-2tDWgA8IK9WCR0V5p4SZw9ZSA6NCGGy\_-iJjJEJQmGxJ5hdap7syUHdxvXvAU4LZLsk?key=F8iBSDyIctvFtu8OlCWpug)\


![](https://lh7-rt.googleusercontent.com/docsz/AD\_4nXegSLyyjgU-vLUGb5YagzjQ566\_Pw3x\_yoj\_fXQI5HGP6T4hl1G1lbpGFB3YIFV1YB8cMYEYxKOuOfRNoTod7DfuiOrNwVgGmMwlVqzKpAIJrbRYiINbWmSYR8qSYym0WNVFb4b7gQfy\_JvQyWaRbEInTpc?key=F8iBSDyIctvFtu8OlCWpug)

\
