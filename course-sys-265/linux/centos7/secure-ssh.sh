#secure-ssh.sh
#author lukemca8
#creates a new ssh user using $1 parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in
#!/bin/bash

# Create user 'test2' with home directory '/home/test2' and bash shell
useradd -m -d /home/test2 -s /bin/bash test2

# Create .ssh directory for user 'test2'
mkdir /home/test2/.ssh

# Copy public key to authorized_keys for user 'test2'
cp /home/luke.mckay/Tech-Journal/course-sys-265/linux/public-keys/id_rsa.pub /home/test2/.ssh/authorized_keys

# Set permissions for .ssh directory
chmod 700 /home/test2/.ssh

# Set permissions for authorized_keys file
chmod 600 /home/test2/.ssh/authorized_keys

# Change ownership of .ssh directory and its contents to user 'test2'
chown -R test2:test2 /home/test2/.ssh

echo "User 'test2' has been created and SSH keys have been configured."
