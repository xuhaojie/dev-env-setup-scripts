FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ARG PKG_URL=https://sourceforge.net/projects/sdcc/files/sdcc-linux-amd64/4.2.0/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2
ARG PKG_FILE=/tmp/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2
ARG TARGET_FILE=/etc/profiles
ARG BASE_URL=https://github.com/xuhaojie
ARG LIB_DIR=/usr/local/

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add gcompat libstdc++ git make \
	&& wget $PKG_URL -O $PKG_FILE \
	&& tar xvf $PKG_FILE -C /opt \
	&& rm $PKG_FILE \
	&& echo export PATH="/opt/sdcc-4.2.0/bin:\$PATH" | tee -a $TARGET_FILE \
	&& source $TARGET_FILE \
#	&& echo "140.82.112.4 github.com" | tee -a /etc/host \	
#	&& git clone $BASE_URL/STM8S_StdPeriph_Lib $LIB_DIR/STM8S_StdPeriph_Lib \
	&& git clone $BASE_URL/STM8L10x_StdPeriph_Lib $LIB_DIR/STM8L10x_StdPeriph_Lib \
#	&& git clone $BASE_URL/STM8TL5x_StdPeriph_Lib $LIB_DIR/STM8TL5x_StdPeriph_Lib \
#	&& git clone $BASE_URL/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib $LIB_DIR/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib

# build 
# docker build -t hodge/alpine-stm8-dev -f ./assets/docker/alpine-stm8-dev.Dockerfile .

# run
# docker run --rm -it --privileged hodge/alpine-stm8-dev 

# verify in docker
# docker run --rm hodge/alpine-stm8-dev stm8flash  -V && sdcc -v
# ls /usr/local/STM8L10x_StdPeriph_Lib
# ls /usr/local/STM8S_StdPeriph_Lib
# ls /usr/local/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib
# ls /usr/local/STM8TL5x_StdPeriph_Lib

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 