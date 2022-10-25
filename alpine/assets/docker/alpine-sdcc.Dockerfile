FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

# change apk source
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update

# install package
RUN apk add gcompat libstdc++

ARG PKG_URL=https://sourceforge.net/projects/sdcc/files/sdcc-linux-amd64/4.2.0/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2
ARG PKG_FILE=/tmp/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2

# install sdcc
RUN echo "download sdcc install package"
RUN wget $PKG_URL -O $PKG_FILE
RUN tar xvf $PKG_FILE -C /opt
RUN rm $PKG_FILE

# setup profile
ARG TARGET_FILE=/etc/profile
RUN echo export PATH="/opt/sdcc-4.2.0/bin:\$PATH" | tee -a $TARGET_FILE
RUN source $TARGET_FILE

# build 
# docker build -t alpine-sdcc -f ./assets/docker/alpine-sdcc.Dockerfile .

# run
# docker run --rm -it alpine-sdcc

# verify in docker
# docker run --rm alpine-sdcc /opt/sdcc-4.2.0/bin/sdcc -v

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 