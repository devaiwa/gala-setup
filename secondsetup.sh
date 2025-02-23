#!/bin/bash
sudo NEEDRESTARTMODE=a apt update && sudo apt upgrade -y
sudo wget --trust-server-names https://links.gala.com/DownloadLinuxNode

shopt -s nullglob
list=(~/gala-node*)
## echo "${list[0]}"
sudo tar xzvf ${list[0]}.tar.gz

yes Y | sudo gala-node/install.sh

echo "Secondary Setup finished"