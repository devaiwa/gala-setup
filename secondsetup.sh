#!/bin/bash
## Setup
sudo NEEDRESTARTMODE=a apt update && sudo apt upgrade -y

##Getting Gala Node software
sudo wget --trust-server-names https://links.gala.com/DownloadLinuxNode

shopt -s nullglob
list=(~/gala-node*)
## echo "${list[0]}"
sudo tar xzvf ${list[0]}

## Installing

yes Y | sudo gala-node/install.sh

## Setting API-KEY (second argument in line)
sudo gala-node config api-key ${2}

licenses=`sudo gala-node licenses`

IFS=', ' read -r -a array <<< "$licenses"

for element in "${array[@]}"
do
    sudo gala-node workload add $element
done

## Naming the Node (first argument in line)
sudo gala-node rename ${1}

## Starting the node
sudo gala-node start 

echo "Secondary Setup finished"