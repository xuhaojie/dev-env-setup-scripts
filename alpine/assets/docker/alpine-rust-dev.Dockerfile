FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ARG target_file=/tmp/rustup.rs

RUN  sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add curl \
	&& curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o $target_file \
	&& chmod +x $target_file \
	&& $target_file -y \
	&& source "$HOME/.cargo/env"

# build 
# docker build -t alpine-rust-dev -f ./assets/docker/alpine-rust-dev.Dockerfile .

# run
# docker run --rm -it  alpine-rust-dev 

# verify in docker
# docker run --rm alpine-rust-dev rustc --version

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 