#!/bin/bash
./install-rust.sh
if [ $# -eq 0 ]; then
./set-cargo-mirror.sh tuna
else
./set-cargo-mirror.sh $1
fi