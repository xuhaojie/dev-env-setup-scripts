#!/bin/bash
directory="/home/hodge/workspace/source/rust"
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