# Commands

## Linux&#x20;

| Command                                                                  | Function                                                                                                                     |
| ------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------- |
| <mark style="color:green;">`pwd`</mark>                                  | Shows the present working directory.                                                                                         |
| <mark style="color:green;">`cd`</mark>`*directory here*`                 | Used to navigate the directory to specified parts.                                                                           |
| <mark style="color:green;">`ls`</mark>                                   | Lists the contents of a directory.                                                                                           |
| <mark style="color:green;">`cd ..`</mark>                                | Used to navigate to the parent directory.                                                                                    |
| <mark style="color:green;">`ls -l`</mark>                                | Shows a long list of files and directories.                                                                                  |
| <mark style="color:green;">`man hier`</mark>                             | Shows the manual page explaining what each directory is used for in the file hierarchy.                                      |
| <mark style="color:green;">`cd ~`</mark>                                 | Navigates to the home directory.                                                                                             |
| <mark style="color:green;">`mkdir`</mark>`*directory here*`              | Creates a directory.                                                                                                         |
| <mark style="color:green;">`sudo`</mark>`*command here*`                 | Elevates user privileges to super user for one command.                                                                      |
| <mark style="color:green;">`groups`</mark>                               | Shows the groups your user is attached to.                                                                                   |
| <mark style="color:green;">`sudo -i`</mark>                              | Converts a normal user to the root user until exited. This gives ultimate privileges across the entire directory and system. |
| <mark style="color:green;">`yum install`</mark>`*package/software here*` | Uses the [YUM](tools.md#yum) tool to install a package.                                                                      |
| <mark style="color:green;">`exit`</mark>                                 | Exits the shell you're in.                                                                                                   |
| <mark style="color:green;">`history`</mark>                              | Shows the history of commands typed.                                                                                         |
| <mark style="color:green;">`history -c`</mark>                           | Clears command history.                                                                                                      |
| <mark style="color:green;">`ls -la`</mark>                               | Lists hidden files in the pwd.                                                                                               |
| <mark style="color:green;">`cat`</mark>`*file here*`                     | Shows a file's data in a readable way.                                                                                       |
| <mark style="color:green;">`tree`</mark>                                 | Displays the list of files in the current directory.                                                                         |

## Windows

| Command                                                                                    | Function                                                                                                                                                                                                                         |
| ------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <mark style="color:blue;">`whoami`</mark>                                                  | Brings up the username of the current user.                                                                                                                                                                                      |
| <mark style="color:blue;">`hostname`</mark>                                                | Brings up the name of the computer                                                                                                                                                                                               |
| <mark style="color:blue;">`Ping -n`</mark>`*ICMP echo request amount here* *address here*` | Tests the connection between two network devices. `-n` lets you set the amount of packets sent.                                                                                                                                  |
| <mark style="color:blue;">`ipconfig /all`</mark>                                           | Brings up all basic network information and network adapters.                                                                                                                                                                    |
| <mark style="color:blue;">`tracert -h`</mark>` ``*hop count here* *address here*`          | Tracert follows the route a ping makes. It shows every hop the ping makes. When a hop occurs, the packet is sent to the next network device in the path to the final destination. `-h` lets you set the maximum amount of hops.  |

