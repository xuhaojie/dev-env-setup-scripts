FROM ubuntu:22.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ARG TARGET_DIR=/tmp/stm8flash

RUN apt-get update \
	&& apt-get install -y git make gcc pkg-config libusb-1.0 libusb-1.0-0-dev \
	&& git clone https://github.com/vdudouyt/stm8flash.git $TARGET_DIR \
	&& cd $TARGET_DIR \
	&& make \
	&& make install \
	&& cd  / \
	&& rm -rf $TARGET_DIR \
	&& apt-get remove -y git make gcc pkg-config libusb-1.0-0-dev \
	&& apt-get autoclean 

# build 
# docker build -t hodge/ubuntu22.04-stm8flash -f ./assets/docker/ubuntu22.04-stm8flash.Dockerfile .

# run
# docker run --rm -it --privileged hodge/ubuntu22.04-stm8flash 

# verify in docker
# docker run --rm --privileged  hodge/ubuntu22.04-stm8flash stm8flash -V

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 