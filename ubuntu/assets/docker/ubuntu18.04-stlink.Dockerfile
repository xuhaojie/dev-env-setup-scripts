FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

RUN apt-get update \
	&& apt-get -y install git gcc build-essential cmake libusb-1.0 libusb-1.0-0-dev \
	&& git clone -b v1.7.0 https://github.com/stlink-org/stlink.git && \
    cd stlink && \
    make clean && \
    make release && \
    make install && \
    ldconfig

# build 
# docker build -t hodge/ubuntu-stlink -f ./assets/docker/ubuntu18.04-stlink.Dockerfile .

# run
# docker run --rm -it --privileged  hodge/ubuntu-stlink 

# verify in docker
# docker run --rm hodge/ubuntu-stlink st-info --version

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 



	
#docker run -t -i --device=/dev/ttyUSB0 ubuntu bash