FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

RUN apt-get update
RUN apt-get install -y git make gcc pkg-config libusb-1.0-0-dev

ARG TARGET_DIR=/tmp/stm8flash
# fetch code
RUN git clone https://github.com/vdudouyt/stm8flash.git $TARGET_DIR

# change dir
WORKDIR $TARGET_DIR

# build
RUN make
# install
RUN make install
# clean
WORKDIR /
RUN rm -rf $TARGET_DIR

ARG BASE_URL=https://github.com/xuhaojie
ARG LIB_DIR=/usr/local

ARG LIB_NAME=STM8S_StdPeriph_Lib

ARG TARGET_DIR=$LIB_DIR/$LIB_NAME
RUN echo "install $LIB_NAME to $TARGET_DIR"
RUN git clone $BASE_URL/$LIB_NAME $TARGET_DIR

ARG LIB_NAME=STM8L10x_StdPeriph_Lib
ARG TARGET_DIR=$LIB_DIR/$LIB_NAME
RUN echo "install $LIB_NAME to $TARGET_DIR"
RUN git clone $BASE_URL/$LIB_NAME $TARGET_DIR

ARG LIB_NAME=STM8TL5x_StdPeriph_Lib
ARG TARGET_DIR=$LIB_DIR/$LIB_NAME
RUN echo "install $LIB_NAME to $TARGET_DIR"
RUN git clone $BASE_URL/$LIB_NAME $TARGET_DIR

ARG LIB_NAME=STM8L15x-16x-05x-AL31-L_StdPeriph_Lib
ARG TARGET_DIR=$LIB_DIR/$LIB_NAME
RUN echo "install $LIB_NAME to $TARGET_DIR"
RUN git clone $BASE_URL/$LIB_NAME $TARGET_DIR

# build 
# docker build -t ubuntu-stm8-dev -f ./assets/docker/ubuntu18.04-stm8-dev.Dockerfile .

# run
# docker run --rm -it --device /dev/mem:/dev/men --cap-add SYS_RAWIO  ubuntu-stm8-dev 

# verify in docker
# docker run --rm ubuntu-stm8-dev stm8flash -V && sdcc -v

# ls /usr/local/STM8L10x_StdPeriph_Lib
# ls /usr/local/STM8S_StdPeriph_Lib
# ls /usr/local/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib
# ls /usr/local/STM8TL5x_StdPeriph_Lib

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 