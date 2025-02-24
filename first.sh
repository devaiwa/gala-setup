#!/bin/bash
## Version 1.0

## Hostname
gettingip=`hostname -I`
IFS='. ' read -r -a array <<< "$gettingip"
ip=${array[3]}
hostname="galanode-$ip-$NODEID"
echo "Hostname: $hostname"
sudo hostnamectl set-hostname $hostname

## Docker Setup
sudo NEEDRESTARTMODE=a apt update && sudo apt upgrade -y
sudo apt install docker.io -y
sudo systemctl enable --now docker

## Rebooting    
## sudo reboot
echo "First Setup finished"