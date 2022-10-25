FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

#ENV DEBIAN_FRONTEND=noninteractive

#ENV TZ=Etc/UTC

RUN apk add gcc-arm-none-eabi --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted

# build 
# docker build -t alpine-gcc-arm-none-eabi -f ./assets/docker/alpine-gcc-arm-none-eabi.Dockerfile .
# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 