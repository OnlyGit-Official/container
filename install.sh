#!/bin/bash

# Create Docker Container
################################################################################################################################################################
# sudo docker run -d -it --name OnlyGit --mount type=bind,source=/Users/hardwaregore/Desktop/Projects/OnlyGit,target=/opt -p 8443:443/tcp -p 822:22/tcp ubuntu #
################################################################################################################################################################

# Install packages:

apt update
apt install openssh-server openssh-client neovim sudo net-tools -y
apt upgrade -y

# Install XAMPP:

