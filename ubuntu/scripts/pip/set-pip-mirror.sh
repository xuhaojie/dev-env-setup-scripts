#!/bin/bash

mirror_names=("tuna" "163" "aliyun" "utsc")
mirror_urls=("https://pypi.tuna.tsinghua.edu.cn/simple" "https://mirrors.163.com/pypi/simple" "http://mirrors.aliyun.com/pypi/simple" "https://pypi.mirrors.ustc.edu.cn/simple ")

if [ $# -eq 0 ]; then
	echo "Please select your pip mirror"
	for i in "${!mirror_names[@]}"; do
		echo "($i) ${mirror_names[$i]} ${mirror_urls[$i]}"
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

#export GO111MODULE="on"
#go env -w GO111MODULE="on"
#echo "export GO111MODULE="on"" >> ~/.profile && source ~/.profile

#export GOPROXY=$mirror_url
#go env -w GOPROXY=$mirror_url
#echo "export GOPROXY=$mirror_url" >> ~/.profile && source ~/.profile

target_file=/home/$USER/.pip/pip.conf
backup_file=$target_file.bak

if [ -f $backup_file ]; then 
	rm $backup_file
fi

mv $target_file $backup_file

#for mirror in ${docker_registry_mirrors[*]}

#[global]
#index-url = https://pypi.tuna.tsinghua.edu.cn/simple
#[install]
#trusted-host = https://pypi.tuna.tsinghua.edu.cn

echo -e "GO111MODULE=on" | tee -a $target_file
echo -e "GOPROXY=$mirror_url" | tee -a $target_file


