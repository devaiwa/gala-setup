#!/bin/bash
## Version 1.0
sudo su

rm -f /etc/machine-id
dbus-uuidgen --ensure=/etc/machine-id
rm /var/lib/dbus/machine-id
dbus-uuidgen --ensure

## Hostname
# gettingip=`hostname -I`
# IFS='. ' read -r -a array <<< "$gettingip"
# ip=${array[3]}

# ipall="$(hostname -I | cut -d" " -f1 | xargs)"
# full="${ip}-${NODEID}"
newname="galanode-$NODEID"
echo "Hostname: $newname"
hostnamectl set-hostname $newname

##echo "$ipall  $hostname" >> /etc/hosts


## Docker Setup
sudo NEEDRESTARTMODE=a apt update && sudo apt upgrade -y
sudo apt-get install virtualbox-guest-additions-iso -y
sudo apt install docker.io -y
sudo systemctl enable --now docker

echo "First Setup finished. rebooting in 30 seconds"
sleep 30
echo "Rebooting now"
## Rebooting  
##sudo reboot
