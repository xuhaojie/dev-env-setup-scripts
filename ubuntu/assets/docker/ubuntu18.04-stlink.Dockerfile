FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

#ENV DEBIAN_FRONTEND=noninteractive

#ENV TZ=Etc/UTC

RUN apt -y update && \
	apt -y install git gcc build-essential cmake libusb-1.0 libusb-1.0-0-dev

# Clone and build stlink
RUN git clone -b v1.7.0 https://github.com/stlink-org/stlink.git && \
    cd stlink && \
    make clean && \
    make release && \
    make install && \
    ldconfig

# build 
# docker build -t ubuntu-stlink:18.04 -f ./assets/docker/ubuntu18.04-stlink.Dockerfile .