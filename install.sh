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
sleep 5
cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
service ssh start

# sudo

echo "
#
# This file MUST be edited with the 'visudo' command as root.
#
# Please consider adding local content in /etc/sudoers.d/ instead of
# directly modifying this file.
#
# See the man page for details on how to write a sudoers file.
#
Defaults	env_reset
Defaults	mail_badpass
Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
Defaults	use_pty

# This preserves proxy settings from user environments of root
# equivalent users (group sudo)
#Defaults:%sudo env_keep += "http_proxy https_proxy ftp_proxy all_proxy no_proxy"

# This allows running arbitrary commands, but so does ALL, and it means
# different sudoers have their choice of editor respected.
#Defaults:%sudo env_keep += "EDITOR"

# Completely harmless preservation of a user preference.
#Defaults:%sudo env_keep += "GREP_COLOR"

# While you shouldn't normally run git as root, you need to with etckeeper
#Defaults:%sudo env_keep += "GIT_AUTHOR_* GIT_COMMITTER_*"

# Per-user preferences; root won't have sensible values for them.
#Defaults:%sudo env_keep += "EMAIL DEBEMAIL DEBFULLNAME"

# "sudo scp" or "sudo rsync" should be able to use your SSH agent.
#Defaults:%sudo env_keep += "SSH_AGENT_PID SSH_AUTH_SOCK"

# Ditto for GPG agent
#Defaults:%sudo env_keep += "GPG_AGENT_INFO"

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root	ALL=(ALL:ALL) ALL
daemon	ALL=(ALL) NOPASSWD: ALL

# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo	ALL=(ALL:ALL) ALL

# See sudoers(5) for more information on "@include" directives:

@includedir /etc/sudoers.d
" > /etc/sudoers

useradd -m -d /home/onlygit -s /bin/bash -G sudo onlygit

sleep 5

# Install XAMPP

./xampp.run
