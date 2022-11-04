#!/bin/bash

function check_root(){
	if [[ $EUID -ne 0 ]] 
	then
		echo "Error:This script must be run as root!" 1>&2
		exit 1
	fi
}

check_root

sudo apt install docker.io

if [ $# -eq 0 ]; then
	echo "you can speicfy user name add to docker group"
else
	echo "add user $1 to group docker"
	addgroup $1 docker
fi


distribution=$(. /etc/os-release;echo $ID$VERSION_ID)

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -

curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit

service docker stop

#dockerd --add-runtime=nvidia=/usr/bin/nvidia-container-runtime

service docker start

# verify
docker ps
