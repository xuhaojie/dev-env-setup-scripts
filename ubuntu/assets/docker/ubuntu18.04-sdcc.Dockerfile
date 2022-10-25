FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

# install package
RUN apt-get update
RUN apt-get install -y sdcc

# build 
# docker build -t ubuntu-sdcc -f ./assets/docker/ubuntu18.04-sdcc.Dockerfile .

# run
# docker run --rm -it alpine-sdcc

# verify in docker
# docker run --rm ubuntu-sdcc /opt/sdcc-4.2.0/bin/sdcc -v

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 