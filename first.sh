#!/bin/bash
## Version 1.0

sudo rm -f /etc/machine-id
sudo dbus-uuidgen --ensure=/etc/machine-id
sudo rm /var/lib/dbus/machine-id
sudo dbus-uuidgen --ensure

## Hostname
gettingip=`hostname -I`
IFS='. ' read -r -a array <<< "$gettingip"
ip=${array[3]}

ipall="$(hostname -I | cut -d" " -f1 | xargs)"

hostname="galanode-$ip-$NODEID"
echo "Hostname: $hostname"
sudo hostnamectl set-hostname $hostname
##sudo echo "$ipall  $hostname" >> /etc/hosts


## Docker Setup
//sudo NEEDRESTARTMODE=a apt update && sudo apt upgrade -y
//sudo apt-get install virtualbox-guest-additions-iso -y
//sudo apt install docker.io -y
//sudo systemctl enable --now docker

## Rebooting    
sudo reboot
echo "First Setup finished"