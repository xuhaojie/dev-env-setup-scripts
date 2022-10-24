#!/bin/bash

if [[ $EUID -ne 0 ]] 
then
	echo "Error:This script must be run as root!" 1>&2
	exit 1
fi

if [ $# -eq 0 ]; then
	echo "please speicfy user name to setup"
	exit 1
fi

apk add docker
rc-update add docker boot

addgroup $1 docker

service docker start
