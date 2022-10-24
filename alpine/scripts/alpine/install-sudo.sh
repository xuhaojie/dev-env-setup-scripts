#!/bin/bash

if [[ $EUID -ne 0 ]] 
then
	echo "Error:This script must be run as root!" 1>&2
	exit 1
fi

if [ $# -eq 0 ]; then
	echo "please speicfy user name to be sudoer"
	exit 1
fi

apk add sudo

echo "add $1 to group wheel"
addgroup $1 wheel

sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers

