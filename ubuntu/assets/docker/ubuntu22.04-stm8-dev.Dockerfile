FROM ubuntu:22.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ARG TARGET_DIR=/tmp/stm8flash
ARG BASE_URL=https://github.com/xuhaojie
ARG LIB_DIR=/usr/local

RUN apt-get update \
	&& echo "========= install sdcc =========" \
	&& apt-get install -y wget unzip git make gcc pkg-config libusb-1.0-0-dev sdcc \
	&& echo "========= install stm8flash =========" \
	&& git clone https://github.com/vdudouyt/stm8flash.git $TARGET_DIR \
	&& cd $TARGET_DIR \
	&& make \
	&& make install \
	&& cd / \
	&& rm -rf $TARGET_DIR \
	&& echo echo "========= install STM8 StdPeriphLib =========" \
	&& wget https://github.com/xuhaojie/STM8S_StdPeriph_Lib/archive/refs/heads/main.zip -O /tmp/STM8S_StdPeriph_Lib.zip \
	&& unzip /tmp/STM8S_StdPeriph_Lib.zip -d /usr/local/ \
	&& wget https://github.com/xuhaojie/STM8L10x_StdPeriph_Lib/archive/refs/heads/main.zip -O /tmp/STM8L10x_StdPeriph_Lib.zip \
	&& unzip /tmp/STM8L10x_StdPeriph_Lib.zip -d /usr/local/ \
	&& wget https://github.com/xuhaojie/STM8TL5x_StdPeriph_Lib/archive/refs/heads/main.zip -O /tmp/STM8TL5x_StdPeriph_Lib.zip \
	&& unzip /tmp/STM8TL5x_StdPeriph_Lib.zip -d /usr/local/ \
	&& wget https://github.com/xuhaojie/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib/archive/refs/heads/main.zip -O /tmp/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib.zip \
	&& unzip /tmp/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib.zip -d /usr/local/ 
# failed due to newwork probleme
#	&& git clone $BASE_URL/STM8S_StdPeriph_Lib $LIB_DIR/STM8S_StdPeriph_Lib \
#	&& git clone $BASE_URL/STM8L10x_StdPeriph_Lib $LIB_DIR/STM8L10x_StdPeriph_Lib \
#	&& git clone $BASE_URL/STM8TL5x_StdPeriph_Lib $LIB_DIR/STM8TL5x_StdPeriph_Lib \
#	&& git clone $BASE_URL/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib $LIB_DIR/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib


# build 
# docker build -t hodge/ubuntu22.04-stm8-dev -f ./assets/docker/ubuntu22.04-stm8-dev.Dockerfile .

# run
# docker run --rm -it --privileged  hodge/ubuntu22.04-stm8-dev 

# verify in docker
# docker run --rm hodge/ubuntu22.04-stm8-dev stm8flash -V && sdcc -v

# ls /usr/local/STM8L10x_StdPeriph_Lib
# ls /usr/local/STM8S_StdPeriph_Lib
# ls /usr/local/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib
# ls /usr/local/STM8TL5x_StdPeriph_Lib

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 