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


target_file=/home/$USER/.pip/pip.conf
backup_file=$target_file.bak

if [ -f $backup_file ]; then 
	rm $backup_file
fi

mv $target_file $backup_file

echo -e "[global]" | tee -a $target_file
echo -e "index-url = $mirror_url" | tee -a $target_file
echo -e "[install]" | tee -a $target_file
echo -e "trusted-host = https://pypi.tuna.tsinghua.edu.cn" | tee -a $target_file


pip3 config list