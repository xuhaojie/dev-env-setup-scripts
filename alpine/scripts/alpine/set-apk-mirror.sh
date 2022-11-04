#!/bin/bash

if [[ $EUID -ne 0 ]] 
then
	echo "Error:This script must be run as root!" 1>&2
	exit 1
fi

mirror_names=("aliyun" "tuna" "ustc")
mirror_urls=("https://mirrors.aliyun.com/alpine" "https://mirrors.tuna.tsinghua.edu.cn/alpine" "https://mirrors.ustc.edu.cn/alpine")

if [ $# -eq 0 ]; then
	echo "Please select your apt mirror"
	for i in "${!mirror_names[@]}"; do
		echo "($i) ${mirror_names[$i]}"
	done
	read input

else
	input=$1
fi

mirror_match=0
for i in "${!mirror_names[@]}"; do
	if [[ $input == ${mirror_names[$i]} ]]; then
		mirror_name=${mirror_names[$i]}
		mirror_url=${mirror_urls[$i]}
		mirror_match=1
		break
	fi
done

if [ $mirror_match -eq 0 ]; then 
	if [[ $input -ge 0 ]] && [[ $input -lt ${#mirror_names[@]} ]]; then
		mirror_name=${mirror_names[$input]}
		mirror_url=${mirror_urls[$input]}
	fi
fi

if [[ $mirror_name == "" ]]; then
	echo "bad mirror"
	exit 1
else 
	echo "change mirror to $mirror_name"
fi

issue=`cat /etc/issue`

echo $issue

dist=${issue#*"Welcome to Alpine Linux "}

dist=${dist%"
Kernel"*}

target_file=/etc/apk/repositories
backup_file=$target_file.bak

if [ -f $backup_file ]; then 
	rm $backup_file
fi

if [ -f $target_file ]; then 
	sudo mv $target_file $backup_file
fi

echo "$mirror_url/v$dist/main" | tee -a $target_file
echo "$mirror_url/v$dist/community" | tee -a $target_file
echo "$mirror_url/edge/main" | tee -a $target_file
echo "$mirror_url/edge/community" | tee -a $target_file
echo "$mirror_url/edge/testing" | tee -a $target_file

apk update

echo "done."




