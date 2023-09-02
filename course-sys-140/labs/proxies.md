---
layout: editorial
---

# Proxies

[Video Demonstration](https://youtu.be/1sEOfzsgzu4)

### Discussion

Proxies are applications that connect to other systems on behalf of a client. The proxy has the ability to inspect the request and response and determine what to do with the data it finds. That is a powerful feature for inspecting web traffic and other applications like email. SSL Proxies are being deployed client-side since so many websites are encrypted (https) and the border services and hardware are not able to inspect the traffic. In this lab, you’ll see how proxies work on SSL traffic. You’re going to get the SSL Certificate errors but in production, you wouldn’t see it. However, most people will continue on to a site even if they receive that message. :-/

### Lab Preparation

* Your Kali server can stay on the NETSEC-WAN segment.
* Use your WIndows 7 system for the victim.
* Find a tutorial that shows how to set the proxy for Google Chrome. The Proxy server will be the IP address of your Kali workstation and the port number to use is 8080. When you find the tutorial, only change the IP and Port number.

### Start the lab

First run mitmproxy by typing:

**mitmproxy**

and then hit Enter. The screen will be blank by default.

**e.g.**

![e.g.](https://i.imgur.com/gucBnra.jpg)

Press

**i**

to prepopulate mitmproxy’s command prompt and set the data that you want to modify. Enter the flow filter (On the bottom left of the screen you will see the two single quotes

**e.g.**

![e.g.](https://i.imgur.com/aca8pnP.jpg)

and enter the text.

**\~u champlain & \~q**

and press **ENTER**.

Switch to your Windows 7 host and within the Chrome browser browse to:

[www.champlain.edu](http://www.champlain.edu/)

When you receive the SSL warning, click ‘Advanced’ and then click the ‘proceed’ link. **Your browser will now hang trying to visit “champlain.edu” because you set the filter above to intercept any web requests containing “champlain” so just let it hang and don’t refresh or reload.**

You as the attacker are in control of this communication channel. Also, this is how security tools inspect traffic and are able to find malicious code in web pages or able to scan files. The proxy will automatically encrypt and decrypt the traffic, inspect it and then send it to the destination.

We now want to modify the intercepted request.

Switch back to Kali. You will see the “champlain.edu” request. Click inside the terminal window and ensure you see two double-arrows next to the ‘champlain.edu’ request (on the left side). If not, then use your arrow key to scroll down to it.

**e.g.**

![e.g.](https://i.imgur.com/YENjjc4.jpg)

Press **ENTER** to open the details view for the intercepted flow.

Press

**e**

to edit the intercepted flow.

mitmproxy asks which part to modify and select URL by using your arrow keys and press **ENTER**.

**e.g.**

![e.g.](https://i.imgur.com/Jv2vnRS.jpg)

mitmproxy will prompt for the editor to use. Select “1” for “nano.”

When nano opens, it will have the request to “https://www.champlain.edu/.” Change the champlain to “uvm.” To save the change, hold down the Ctrl key and type x. **(Ctrl-x)**. Then hit **Y** and then **Enter** to save the change.

You’ll see the Host field changed.

**e.g.**

![e.g.](https://i.imgur.com/0Gtec9z.jpg)

Press

**q**

to go back to the flow details view.

Press

**a**

Which will automatically allow your Google Chrome to proceed. Switch back to Chrome and see what is displayed.

Did it redirect you to the UVM website? In a real attack, the proxy settings will be done by the threat actors code.
