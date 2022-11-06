FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

RUN apt-get update \
	&& apt-get -y install gcc-arm-none-eabi

# build 
# docker build -t hodge/ubuntu-gcc-arm-none-eabi -f ./assets/docker/ubuntu18.04-gcc-arm-none-eabi.Dockerfile .

# run
# docker run --rm -it hodge/ubuntu-gcc-arm-none-eabi

# verify
# docker run --rm hodge/ubuntu-gcc-arm-none-eabi arm-none-eabi-gcc -v

# docker run --rm -it -v ~/Workspace/source/STM32/STM32-WiFiBox-Linux:/workspace hodge/ubuntu-gcc-arm-none-eabi

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 