#!/bin/bash

## Ubuntu, Mint Linux
## Install from src git repo
#sudo apt-get install sdcc sdcc-doc sdcc-libraries sdcc-ucsim
#sudo apt-get install build-essential pkg-config autoconf automake libtool libusb-dev libusb-1.0-0-dev libhidapi-dev

echo "install stm8flash..."
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

echo "install sdcc..."
sudo apt install -y sdcc

base_url=https://github.com/xuhaojie

lib_names=("STM8S_StdPeriph_Lib" "STM8L10x_StdPeriph_Lib" "STM8TL5x_StdPeriph_Lib" "STM8L15x-16x-05x-AL31-L_StdPeriph_Lib")
lib_count=${#lib_names[@]}

echo "install std periph libs..."

for i in "${!lib_names[@]}"; do
	lib_name=${lib_names[$i]}
	echo "install  $i/$lib_count $lib_name"
	target_dir=$HOME/$lib_name
	if [ ! -d $target_dir  ]; then
		git clone $base_url/$lib_name $target_dir
	fi
done

