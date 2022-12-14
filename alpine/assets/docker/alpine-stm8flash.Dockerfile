FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ARG TARGET_DIR=/tmp/stm8flash

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add make gcc musl-dev libusb-dev libusb git \
	&& git clone https://github.com/vdudouyt/stm8flash.git $TARGET_DIR \
	&& cd $TARGET_DIR \
	&& make \
	&& make install \
	&& apk del -r make gcc musl-dev libusb-dev git \
	&& cd / \
	&& rm -rf $TARGET_DIR


# build 
# docker build -t hodge/alpine-stm8flash -f ./assets/docker/alpine-stm8flash.Dockerfile .

# run
# docker run --rm -it --device /dev/ttyUSB0 hodge/alpine-stm8flash 
# docker run --rm -it --device /dev/ttyUSB0:/dev/ttyUSB0 hodge/alpine-stm8flash 

# verify in docker
# docker run --rm hodge/alpine-stm8flash stm8flash -V

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 