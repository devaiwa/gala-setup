#!/bin/bash
## Version 1.0

## Hostname
gettingip=`hostname -I`
IFS='. ' read -r -a array <<< "$gettingip"
ip=${array[3]}

ipall="$(hostname -I | cut -d" " -f1 | xargs)"




hostname="galanode-$ip-$NODEID"
echo "Hostname: $hostname"
sudo hostnamectl set-hostname $hostname
echo "$ipall  $hostname" >> /etc/hosts


## Docker Setup
//sudo NEEDRESTARTMODE=a apt update && sudo apt upgrade -y
//sudo apt install docker.io -y
//sudo systemctl enable --now docker

## sudo apt-get install virtualbox-guest-additions-iso -y

## Rebooting    
## sudo reboot
echo "First Setup finished"