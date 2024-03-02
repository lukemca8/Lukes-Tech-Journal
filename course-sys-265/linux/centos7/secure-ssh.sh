#secure-ssh.sh
#author lukemca8
#creates a new ssh user using $1 parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in
#!/bin/bash

# Check if username parameter is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USERNAME=$1

# Create user with provided username, home directory '/home/<username>', and bash shell
useradd -m -d /home/$USERNAME -s /bin/bash $USERNAME

# Create .ssh directory for the user
mkdir /home/$USERNAME/.ssh

# Copy public key to authorized_keys for the user
cp /home/luke.mckay/Tech-Journal/course-sys-265/linux/public-keys/id_rsa.pub /home/$USERNAME/.ssh/authorized_keys

# Set permissions for .ssh directory
chmod 700 /home/$USERNAME/.ssh

# Set permissions for authorized_keys file
chmod 600 /home/$USERNAME/.ssh/authorized_keys

# Change ownership of .ssh directory and its contents to the user
chown -R $USERNAME:$USERNAME /home/$USERNAME/.ssh

echo "User '$USERNAME' has been created and SSH keys have been configured."
