# Apache and Certificate

## Step 1:

\
Setting up HTTPD (Apache) on CentOS (Rocky)

A. Check Connection

1. Open the terminal and type "ip addr" to find your IP address. Note it down for later use. You can also ensure your connection is working by typing "ping -c1 google.com".

B. Set-up Apache/HTTPD

1. Install Apache/HTTPD by running the command: `yum install -y httpd`.
2. Allow HTTP traffic through the firewall using: `firewall-cmd --permanent --add-port=80/tcp`.
3. Reload the firewall configuration with: `firewall-cmd --reload`.
4. Check if the firewall is open for HTTP traffic: `firewall-cmd --query-port=80/tcp` (it should return "yes").
5. Start the HTTPD service: `systemctl start httpd`.
6. Verify the current status of Apache: `systemctl status httpd`.

C. Testing Your Server

1. On the terminal of your server, run: `curl http://Your_IP_Here | grep "Test Page"`.
2. Start your Kali VM.
3. Open a web browser.
4. Navigate to the URL "http://Your\_IP\_Here".

Deliverable-1: Submit a screenshot of the output of the curl command.

Deliverable-2: Submit a screenshot of the Apache Test Page.

Basic HTML Page

1. Navigate to "/var/www/html" directory in Rocky as root.
2. Use the text editor "vi" to create a file named "index.html". Remember to save the file after editing.
3. Use the following HTML code as a guide to create your HTML document:

```html
htmlCopy code<html>
 <head>
   <title>
     Title goes here
   </title>
 </head>
 <body>
   Content goes here
 </body>
</html>
```

Tips for using vi:

* Press "i" to enter insert mode.
* Press "ESC" to exit insert mode.
* In command mode, type ":wq" to save and exit.

Can you view this page from your workstation's browser?

Deliverable-3: Submit a screenshot of your web page rendered in a browser.

Adding PHP

1. Install PHP and necessary modules with: `yum install php php-common php-cli php-curl`.
2. Test PHP installation with: `php -v`.
3. Restart HTTPD service with: `systemctl restart httpd`.
4. Check HTTPD status with: `systemctl status httpd`.
5. Edit "index.html" and replace its content with the following PHP code:

```php
phpCopy code<?php
     echo("<p>Some server side code here</p> <br>");
    // Variables start with $
    $var1 = "Your Name";
    $var2 = "First Page";
?>

<html>
 <head>
   <title>
       <?php  echo $var2;  ?>
   </title>
 </head>
 <body>
   First Page of <?php echo $var1;  ?>
 </body>
</html>
```

6. Change the file extension to ".php" using: `mv index.html index.php`.

Deliverable-4: Submit a screenshot of your web page rendered in a browser with PHP added.

Personalizing Your Page

Visit [W3Schools HTML Tutorial](https://www.w3schools.com/html/) and add custom content to your page using different HTML tags such as `<h1>`, `<p>`, `<ul>`, `<li>`, etc.

Deliverable-5: Submit a screenshot of your personalized web page rendered in a browser.



## Step 2&#x20;

Configuring a Certificate Authority using OpenSSL

I. Create the Certificate Authority (CA)

On the Kali VM:

1. File system preparation:
   * Create a directory to store keys and certificates: `/root/ca`.
   * Navigate to the newly created directory: `cd /root/ca`.
   * Create necessary subdirectories: `mkdir certs crl newcerts private`.
   * Create an empty index file: `touch index.txt`.
   * Set an initial serial number: `echo 1000 > serial`.
   * Edit the OpenSSL configuration file: `nano /usr/lib/ssl/openssl.cnf`.
   * Change the directory paths under `[CA_default]` to point to the newly created directory: `dir = /root/ca`.
2. Generate the CA's private key:
   * Command: `openssl genrsa -des3 -out private/cakey.pem 2048`.
   * Description: Generates a RSA private key with 2048-bit length encrypted with the DES algorithm and saves it to `private/cakey.pem`.
3. Create the CA certificate:
   * Command: `openssl req -new -x509 -days 365 -key private/cakey.pem -out cacert.pem`.
   * Description: Generates a new certificate request and self-signs it to create the CA certificate (`cacert.pem`). The certificate is valid for 365 days.
   * Note the entries. Use Joyce310 as the organization name, org unit name, and common name. Make note of the password.

II. Create the certificate request on your web server (\*Rocky)

1. Generate a private key and certificate request for the web server:
   * under the HTML directory
   * Command: `openssl req -newkey rsa:2048 -keyout websrv.key -out websrv.csr`.
   * Description: Creates a new RSA private key (`websrv.key`) and a certificate signing request (`websrv.csr`) for the web server.
   * Use the same entries from the CA certificate creation.
2. Transfer the CSR file to the Certificate Authority:
   * Use SCP to copy the `websrv.csr` file to the Certificate Authority server.
   * `scp "filename" your_username@remotehost.edu:/some/remote/directory`
   * you can use the IP instead of the hostname

III. Sign the certificate on the Certificate Authority

On the Certificate Authority Server:

1. Sign the certificate request:
   * Command: `openssl ca -out websrv.crt -infiles websrv.csr`.
   * Description: Signs the certificate request (`websrv.csr`) using the CA's private key and generates the signed certificate (`websrv.crt`).
2. Transfer the signed certificate file back to the web server using SCP.
   * transfer it to the html directory.

IV. Submission:

Submit screenshots with descriptions and cat outputs of the following files:

* `cacert.pem`: The Certificate Authority's self-signed certificate.
* `websrv.key`: Private key generated for the web server.
* `websrv.crt`: Signed certificate for the web server.



## Step 3:

\
Setting up HTTPS on Your CentOS Web Server

I. Setting up Certificate and Key on the web server

1. Copy the certificate and private key files to the following locations:
   * Web Server certificate: `/etc/pki/tls/certs\`
     * `sudo cp /path/to/server.crt /etc/pki/tls/certs/`
   * Web server private key: `/etc/pki/tls/private`
     * `sudo cp /path/to/server.key /etc/pki/tls/private/`
2. Install mod\_ssl for Apache:
   * Command: `yum -y install mod_ssl`
3. Update `/etc/httpd/conf.d/ssl.conf`:
   * Find `SSLCertificateFile` and ensure the path and filename match your certificate file.
   * Find `SSLCertificateKeyFile` and ensure the path and filename match your key file.
   * Save the file.
4.  Update firewall to allow port 443 and reload firewall:

    Use appropriate commands for your firewall configuration.

    * `sudo firewall-cmd --zone=public --add-port=443/tcp --permanent`
    * sudo firewall-cmd --reload
      * if that doesnt work:&#x20;
        * sudo yum install ufw
        * sudo ufw enable
        * sudo ufw allow 443&#x20;
        * sudo ufw reload
5. Restart httpd:
   * Command: `systemctl restart httpd`
6. Browse to your server using HTTPS:
   * Open a web browser and navigate to your server's HTTPS address (e.g., `https://your_server_ip`).
   * You should see a successful loading of your server with HTTPS.

Submit a screenshot of your browser successfully loading your server using HTTPS.

