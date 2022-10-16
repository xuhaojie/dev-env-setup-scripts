#!/bin/bash

function check_root(){
	if [[ $EUID -ne 0 ]] 
	then
		echo "Error:This script must be run as root!" 1>&2
		exit 1
	fi
}

#check_root

mirror_names=("cn.archive.ubuntu.com" "aliyun" "tuna" "163" "ustc")
mirror_urls=("http://cn.archive.ubuntu.com/ubuntu/" "http://mirrors.aliyun.com/ubuntu/" "https://mirrors.tuna.tsinghua.edu.cn/ubuntu/" "http://mirrors.163.com/ubuntu/" "https://mirrors.ustc.edu.cn/ubuntu/")

if [ $# -eq 0 ]; then
	echo "Please select your apt mirror"
	for i in "${!mirror_names[@]}"; do
		echo "($i) ${mirror_names[$i]}"
	done
	read input

else
	input=$1
fi

if [[ $input -ge 0 ]] && [[ $input -lt ${#mirror_names[@]} ]]; then
	mirror_name=${mirror_names[$input]}
	mirror_url=${mirror_urls[$input]}
else
	for i in "${!mirror_names[@]}"; do
		if [[ $input == ${mirror_names[$i]} ]]; then
			mirror_name=${mirror_names[$i]}
			mirror_url=${mirror_urls[$i]}
			break
		fi
	done
fi

if [[ $mirror_name == "" ]]; then
	echo "bad mirror"
	exit 1
else 
	echo "change mirror to $mirror_name"
fi

lsb_release=`lsb_release -c`

dist=${lsb_release#*Codename:[[:space:]]}

echo $dist


target_file=/etc/apt/source.list

sudo mv $target_file $target_file.bak

echo "deb $mirror_url $dist main restricted universe multiverse" | sudo tee -a $target_file
echo "deb-src $mirror_url $dist main restricted universe multiverse" | sudo tee -a $target_file

echo "deb $mirror_url $dist-security main restricted universe multiverse" | sudo tee -a $target_file
echo "deb-src $mirror_url $dist-security main restricted universe multiverse" | sudo tee -a $target_file

echo "deb $mirror_url $dist-updates main restricted universe multiverse" | sudo tee -a $target_file
echo "deb-src $mirror_url $dist-updates main restricted universe multiverse" | sudo tee -a $target_file

echo "deb $mirror_url $dist-proposed main restricted universe multiverse" | sudo tee -a $target_file
echo "deb-src $mirror_url $dist-proposed main restricted universe multiverse" | sudo tee -a $target_file

echo "deb $mirror_url $dist-backports main restricted universe multiverse" | sudo tee -a $target_file
echo "deb-src $mirror_url $dist-backports main restricted universe multiverse" | sudo tee -a $target_file

echo "done."




