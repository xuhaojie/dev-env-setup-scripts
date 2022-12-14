#!/bin/bash

if [[ $EUID -ne 0 ]] 
then
	echo "Error:This script must be run as root!" 1>&2
	exit 1
fi

target_file=/tmp/rustup.rs
while [ ! -f $target_file ]; do 
	#wget $url -o $target_file
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o $target_file
done

chmod +x $target_file
$target_file -y
source "$HOME/.cargo/env"

# verify
rustc --version
