#!/bin/bash

mirror_names=("goproxy.cn" "golang.com.cn")
mirror_urls=("https://goproxy.cn,direct" "https://proxy.golang.com.cn,direct")



if [ $# -eq 0 ]; then
	echo "Please select your cargo mirror"
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

export GO111MODULE="on"
#go env -w GO111MODULE="on"
#echo "export GO111MODULE="on"" >> ~/.profile && source ~/.profile

export GOPROXY=$mirror_url
#go env -w GOPROXY=$mirror_url
#echo "export GOPROXY=$mirror_url" >> ~/.profile && source ~/.profile

target_file=/home/$USER/.config/go/env
backup_file=$target_file.bak

if [ -f $backup_file ]; then 
	rm $backup_file
fi

mv $target_file $backup_file

#for mirror in ${docker_registry_mirrors[*]}

echo -e "GO111MODULE=on" | tee -a $target_file
echo -e "GOPROXY=$mirror_url" | tee -a $target_file


