#!/bin/bash



mirror_comments=("crates-io" "中国科学技术大学" "上海交通大学" "清华大学" "rustcc社区")
mirror_names=("crates-io" "ustc" "sjtu" "tuna" "rustcc")
mirror_urls=("https://github.com/rust-lang/crates.io-index" "https://mirrors.ustc.edu.cn/crates.io-index" "https://mirrors.sjtug.sjtu.edu.cn/git/crates.io-index" "https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git" "https://code.aliyun.com/rustcc/crates.io-index.git")

if [ $# -eq 0 ]; then
	echo "Please select your cargo mirror"
	for i in "${!mirror_comments[@]}"; do
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

target_file=/home/$USER/.cargo/config
backup_file=$target_file.bak

if [ -f $backup_file ]; then 
	rm $backup_file
fi

mv $target_file $backup_file

#for mirror in ${docker_registry_mirrors[*]}
for i in "${!mirror_urls[@]}"
do
	echo -e "[source.${mirror_names[$i]}]" | tee -a $target_file
	echo -e "registry=\"${mirror_urls[$i]}\"" | tee -a $target_file
	if [ $i -eq 0 ] && [ "$mirror_name" != "" ]
	then
		echo -e "replace-with='$mirror_name'" | tee -a $target_file
	fi
done

