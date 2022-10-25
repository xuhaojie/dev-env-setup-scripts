FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

#ENV DEBIAN_FRONTEND=noninteractive

#ENV TZ=Etc/UTC

RUN apt -y update
RUN	apt -y install gcc-arm-none-eabi


# build 
# docker build -t ubuntu-gcc-arm-none-eabi -f ./assets/docker/ubuntu18.04-gcc-arm-none-eabi.Dockerfile .
# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 