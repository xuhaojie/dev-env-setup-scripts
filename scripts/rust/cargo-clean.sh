#!/bin/bash

if [ $# -eq 0 ]; then
	echo "please speify the paht to clean"
	exit 1
fi

directory=$1


function clean_dir(){
    for file in `ls $1`
    do
        if [ -d $1"/"$file ]
        then
            clean_dir $1"/"$file
        else
			if [ "$file" == "Cargo.toml" ]; then
				project=$1"/"$file
            	echo -n "clean $1 ..."
				cargo clean --manifest-path $project -q
				echo " done."
			fi
        fi
    done
}
clean_dir $1
