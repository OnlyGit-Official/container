#!/bin/bash

# Create Docker Container
################################################################################################################################################################
# sudo docker run -d -it --name OnlyGit --mount type=bind,source=/Users/hardwaregore/Desktop/Projects/OnlyGit,target=/opt -p 8443:443/tcp -p 822:22/tcp ubuntu #
################################################################################################################################################################

# Install packages:

echo "Installing Packages"

apt update
apt install openssh-server openssh-client neovim sudo net-tools wget curl git -y
apt upgrade -y

# Download XAMPP:

wget http://192.168.50.50/xampp.run

chmod +x ./xampp.run

# Create Directories:

mkdir /show
mkdir /git

# Grant Permissions

chmod 777 /show
chmod 777 /git

# SSH

ssh-keygen
