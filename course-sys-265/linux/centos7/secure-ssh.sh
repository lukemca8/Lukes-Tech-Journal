#secure-ssh.sh
#author lukemca8
#creates a new ssh user using $1 parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in
#!/bin/bash

# Check if a username is provided as a parameter
if [ $# -eq 0 ]; then
    echo 'Usage: $0 <username>'
    exit 1
fi

# Extract the username from the parameter
username="$1"

# Create a passwordless user if it doesn't exist
if id "$username" &>/dev/null; then
    echo "User $username already exists."
else
    sudo useradd -m -s /bin/bash "$username"
    echo "User $username has been created."
fi

# Set the public key for passwordless SSH
public_key_path="/home/luke.mckay/Tech-Journal/linux/public-keys/id_rsa.pub"
if [ ! -f "$public_key_path" ]; then
    echo "Public key not found at $public_key_path"
    exit 1
fi

# Set up SSH keys
sudo mkdir -p "/home/$username/.ssh"
sudo cp "$public_key_path" "/home/$username/.ssh/authorized_keys"
sudo chmod 700 "/home/$username/.ssh"
sudo chmod 600 "/home/$username/.ssh/authorized_keys"
sudo chown -R "$username:$username" "/home/$username/.ssh"

echo "User $username has been set up for passwordless SSH access."
