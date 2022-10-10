#!/bin/bash

if [ $# -eq 0 ]; then
	echo "please speify the paht to clean"
	exit 1
fi

directory=$1

for file in `ls $directory`
do
        if [ -d $directory/$file ]
        then
			echo clean $file with cargo
			cd $directory/$file
			cargo clean
			cd ..
        fi
done 