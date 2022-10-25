#!/bin/bash

if [[ $EUID -ne 0 ]] 
then
	echo "Error:This script must be run as root!" 1>&2
	exit 1
fi

apk add docker
rc-update add docker boot

if [ $# -eq 0 ]; then
	echo "you can speicfy user name add to docker group"
else
	echo "add user $1 to group docker"
	addgroup $1 docker
fi

service docker start

echo "please reboot to take effect"

# verify
docker ps
