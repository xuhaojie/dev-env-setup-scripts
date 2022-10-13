#!/bin/bash

## Ubuntu, Mint Linux
## Install from src git repo
#sudo apt-get install sdcc sdcc-doc sdcc-libraries sdcc-ucsim
#sudo apt-get install build-essential pkg-config autoconf automake libtool libusb-dev libusb-1.0-0-dev libhidapi-dev
sudo apt install -y build-essential  pkg-config libusb-1.0-0-dev
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
