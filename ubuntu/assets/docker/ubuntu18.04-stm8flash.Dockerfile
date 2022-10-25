FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ENV TARGET_DIR=/tmp/stm8flash
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

# build 
# docker build -t ubuntu18.04-stm8flash -f ./assets/docker/ubuntu18.04-stm8flash.Dockerfile .
# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 