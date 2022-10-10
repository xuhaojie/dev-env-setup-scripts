#!/bin/bash

function check_root(){
	if [[ $EUID -ne 0 ]] 
	then
		echo "Error:This script must be run as root!" 1>&2
		exit 1
	fi
}
target_file=/home/$USER/.cargo/config



mirror_comments=("crates-io" "中国科学技术大学" "上海交通大学" "清华大学" "rustcc社区")
mirror_names=("crates-io" "ustc" "sjtu" "tuna" "rustcc")
mirror_urls=("https://github.com/rust-lang/crates.io-index" "https://mirrors.ustc.edu.cn/crates.io-index" "https://mirrors.sjtug.sjtu.edu.cn/git/crates.io-index" "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git" "https://code.aliyun.com/rustcc/crates.io-index.git")

echo "Please select your cargo mirror"
for i in "${!mirror_comments[@]}"
do
	echo "($i) ${mirror_comments[$i]}"
done

read input

case $input in
	1|2|3|4) mirror_name=${mirror_names[$input]};;
	*) mirror_name="";;
esac

if [[ $input -ne 0 ]]
then
	echo "change mirror to $mirror_name"
fi

sudo mv $target_file $target_file.bak

#for mirror in ${docker_registry_mirrors[*]}
for i in "${!mirror_urls[@]}"
do
	echo -e "[source.${mirror_names[$i]}]" | sudo tee -a $target_file
	echo -e "registry=\"${mirror_urls[$i]}\"" | sudo tee -a $target_file
	if [ $i -eq 0 ] && [ "$mirror_name" != "" ]
	then
		echo -e "replace-with='$mirror_name'" | sudo tee -a $target_file
	fi
done

