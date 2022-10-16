#!/bin/bash

if [[ $EUID -ne 0 ]] 
then
	echo "Error:This script must be run as root!" 1>&2
	exit 1
fi

target_file=/etc/docker/daemon.json

sudo mv $target_file $target_file.bak

mirrors=("https://registry.docker-cn.com" "http://hub-mirror.c.163.com" "https://docker.mirrors.ustc.edu.cn")

echo -e -n "{\n\t\"registry-mirrors\" : [" | sudo tee -a $target_file

for i in "${!mirrors[@]}"
do
	if [ $i -eq 0 ]
	then
		echo -e -n "\n\t\t\"${mirrors[$i]}\"" | sudo tee -a $target_file
	else
		echo -e  -n ",\n\t\t\"${mirrors[$i]}\"" | sudo tee -a $target_file
	fi
done
echo -e "\n\t]\n}" | sudo tee -a $target_file

sudo service docker restart

