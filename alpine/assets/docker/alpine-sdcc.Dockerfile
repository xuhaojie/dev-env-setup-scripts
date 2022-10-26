FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ARG PKG_URL=https://sourceforge.net/projects/sdcc/files/sdcc-linux-amd64/4.2.0/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2
ARG PKG_FILE=/tmp/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2
ARG TARGET_FILE=/etc/profiles

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add gcompat libstdc++ \
	&& wget $PKG_URL -O $PKG_FILE \
	&& tar xvf $PKG_FILE -C /opt \
	&& rm $PKG_FILE \
	&& echo export PATH="/opt/sdcc-4.2.0/bin:\$PATH" | tee -a $TARGET_FILE \
	&& source $TARGET_FILE

# build 
# docker build -t alpine-sdcc -f ./assets/docker/alpine-sdcc.Dockerfile .

# run
# docker run --rm -it alpine-sdcc

# verify in docker
# docker run --rm alpine-sdcc /opt/sdcc-4.2.0/bin/sdcc -v

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 