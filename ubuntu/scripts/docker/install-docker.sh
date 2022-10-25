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

service docker start

# verify
docker ps
