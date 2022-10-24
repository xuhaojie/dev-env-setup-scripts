#!/bin/bash

sudo apk add make gcc libusb-dev
pre_pwd=${PWD}

target_dir="/tmp/stm8flash"
while [ ! -d $target_dir  ]
do 
	rmdir $target_dir
	git clone https://github.com/vdudouyt/stm8flash.git $target_dir
done
cd $target_dir
make
sudo make install
cd $pre_pwd
