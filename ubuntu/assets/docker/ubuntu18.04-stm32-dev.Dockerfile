FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

RUN apt-get update \
	&& apt-get -y install gcc-arm-none-eabi git gcc build-essential cmake libusb-1.0 libusb-1.0-0-dev \
	&& git clone -b v1.7.0 https://github.com/stlink-org/stlink.git && \
    cd stlink && \
    make clean && \
    make release && \
    make install && \
    ldconfig
# build 
# docker build -t hodge/ubuntu18.04-stm32-dev -f ./assets/docker/ubuntu18.04-stm32-dev.Dockerfile .

# run
# docker run --rm -it --privileged hodge/ubuntu18.04-stm32-dev

# verify in docker
# docker run --rm -it --privileged hodge/ubuntu18.04-stm32-dev st-info --version
#
# docker run --rm -it --device=/dev/stlinkv2_5 hodge/ubuntu18.04-stm32-dev st-info --version

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 