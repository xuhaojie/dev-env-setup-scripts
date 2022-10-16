#!/bin/bash
echo "install docker..."
./install-docker.sh

echo "set docker registry mirror..."
./set-docker-mirror.sh 1
