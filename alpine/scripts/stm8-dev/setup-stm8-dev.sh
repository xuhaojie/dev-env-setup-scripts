#!/bin/bash
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

echo "install stlink..."
sudo ./install-stlink.sh

echo "install stm8flash..."
sudo ./install-stm8flash.sh