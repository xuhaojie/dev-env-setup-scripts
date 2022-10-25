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

apk add podman
rc-update add cgroups
rc-service cgroups start

modprobe tun
echo tun >>/etc/modules

echo $1:100000:65536 >/etc/subuid

echo $1:100000:65536 >/etc/subgid

echo "please reboot to take effect"