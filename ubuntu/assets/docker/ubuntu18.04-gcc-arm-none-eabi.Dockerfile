FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

RUN apt-get update \
	&& apt-get -y install gcc-arm-none-eabi

# build 
# docker build -t ubuntu-gcc-arm-none-eabi -f ./assets/docker/ubuntu18.04-gcc-arm-none-eabi.Dockerfile .

# run
# docker run --rm -it ubuntu-gcc-arm-none-eabi

# verify
# arm-none-eabi-gcc -v

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 