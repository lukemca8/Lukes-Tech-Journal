#secure-ssh.sh
#author lukemca8
#creates a new ssh user using $1 parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in
echo "
#!/bin/bash

# Check if a username is provided as a parameter
if [ $# -eq 0 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

# Extract the username from the parameter
username=$1

# Check if the public key exists
public_key_path="/home/luke.mckay/Tech-Journal/linux/public-keys/id_rsa.pub"
if [ ! -f "$public_key_path" ]; then
    echo "Public key not found at $public_key_path"
    exit 1
fi

# Create a passwordless user
sudo useradd -m -s /bin/bash $username

# Set permissions for the .ssh directory and authorized_keys file
sudo mkdir -p /home/$username/.ssh
sudo chmod 700 /home/$username/.ssh
sudo chmod 600 /home/$username/.ssh/authorized_keys

# Copy the public key to the authorized_keys file
sudo cp $public_key_path /home/$username/.ssh/authorized_keys

# Set correct ownership of the .ssh directory and authorized_keys file
sudo chown -R $username:$username /home/$username/.ssh

# Enable passwordless sudo for the new user
echo "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$username

echo "User $username has been created with passwordless SSH access using the provided public key."
"
