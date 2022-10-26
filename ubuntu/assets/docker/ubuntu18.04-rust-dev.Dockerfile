FROM ubuntu:18.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ARG TARGET_FILE=/tmp/rustup.rs
RUN apt-get update \
	&& apt-get -y install  curl\
	&& curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o $TARGET_FILE \
	&& chmod +x $TARGET_FILE \
	&& $TARGET_FILE -y \
	&& source $HOME/.cargo/env


# build 
# docker build -t hodge/ubuntu-rust-dev -f ./assets/docker/ubuntu18.04-rust-dev.Dockerfile .

# run
# docker run --rm -it hodge/ubuntu-rust-dev 

# verify in docker
# docker run --rm hodge/ubuntu-rust-dev rustc --version

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 