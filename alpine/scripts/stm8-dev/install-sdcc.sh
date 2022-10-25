#!/bin/bash

pkg_url=https://sourceforge.net/projects/sdcc/files/sdcc-linux-amd64/4.2.0/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2
pkg_file=/tmp/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2

while [ ! -f $pkg_file ]
do
	echo "download stlink install package"
	wget $pkg_url -O $pkg_file
done

sudo tar xvf $pkg_file -C /opt

rm $pkg_file

target_file=/etc/profile
echo export PATH="/opt/sdcc-4.2.0/bin:\$PATH" | tee -a $target_file

source $target_file

#verify
sdcc -v
