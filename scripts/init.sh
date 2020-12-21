#!/bin/bash 

# Add vagrant user to sudoers.
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic
#enable password authentication via ssh
sed 's/#   PasswordAu.*/PasswordAuthentication yes/' /etc/ssh/ssh_config
#install docker
sudo apt-get -y install  apt-transport-https  ca-certificates  curl  gnupg-agent software-properties-common wget gnupg2 zip unzip
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get -y update
apt-get -y install docker-ce docker-ce-cli containerd.io
usermod -aG docker vagrant
apt-get update
apt-get upgrade -y

