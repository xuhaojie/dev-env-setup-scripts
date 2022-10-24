#!/bin/bash

echo "install golang..."
./install-go.sh
echo "set go proxy..."
if [ $# -eq 0 ]; then
./set-go-proxy.sh goproxy.cn
else
./set-go-proxy.sh  $1
fi