#!/bin/bash

# Create Docker Container
################################################################################################################################################################
# sudo docker run -d -it --name OnlyGit --mount type=bind,source=/Users/hardwaregore/Desktop/Projects/OnlyGit,target=/opt -p 8443:443/tcp -p 822:22/tcp ubuntu #
################################################################################################################################################################

# Install packages:

echo "Installing Packages"

apt update
apt install openssh-server openssh-client neovim sudo net-tools wget curl -y
apt upgrade -y

# Download XAMPP:

echo "Enter XAMPP installer script IP:"
read ip

wget $ip/xampp.run

chmod +x ./xampp.run

# Create Directories:

mkdir /show
mkdir /git

# Grant Permissions

chmod 777 /show
chmod 777 /git

# Post install

echo "After XAMPP has finished installing, run the following commands:"
echo "ssh-keygen"
echo "cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys"

echo ""

echo "Then, add the following into /etc/sudoers"
echo "daemon    ALL=(ALL) NOPASSWD: ALL"

echo ""

# Install XAMPP

./xampp.run
