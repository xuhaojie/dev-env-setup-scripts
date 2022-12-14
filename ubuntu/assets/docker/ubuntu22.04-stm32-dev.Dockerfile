FROM ubuntu:22.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

RUN apt-get update \
	&& apt-get -y install stlink-tools openocd make git gcc-arm-none-eabi \
	&& apt-get clean

# build 
# docker build -t hodge/ubuntu22.04-stm32-dev -f ./assets/docker/ubuntu22.04-stm32-dev.Dockerfile .

# run
# docker run --rm -it --privileged hodge/ubuntu22.04-stm32-dev

# verify in docker
# docker run --rm -it --privileged hodge/ubuntu22.04-stm32-dev st-info --version
#
# docker run --rm -it --device=/dev/stlinkv2_5 hodge/ubuntu22.04-stm32-dev st-info --version

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 