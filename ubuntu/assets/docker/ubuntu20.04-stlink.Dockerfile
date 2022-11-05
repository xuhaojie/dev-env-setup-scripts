FROM ubuntu:20.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

RUN apt-get update \
	&& apt-get -y install stlink-tools

# build 
# docker build -t hodge/ubuntu20.04-stlink -f ./assets/docker/ubuntu20.04-stlink.Dockerfile .

# run
# docker run --rm -it --device=/dev/stlinkv2_5 hodge/ubuntu20.04-stlink 

# verify in docker
# docker run --rm -it --device=/dev/stlinkv2_5 hodge/ubuntu20.04-stlink st-info --version

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 