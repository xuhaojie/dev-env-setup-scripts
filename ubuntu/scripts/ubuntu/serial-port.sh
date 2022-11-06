#!/bin/bash

if [[ $EUID -eq 0 ]] 
then
	echo "Error:This script cannot be run as root!" 1>&2
	exit 1
fi

CUR_USER=$USER
echo "add user $CUR_USER to dialout group"
sudo usermod -aG dialout $CUR_USER