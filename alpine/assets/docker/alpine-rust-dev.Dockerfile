FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ARG TARGET_FILE=/tmp/rustup.rs

RUN  sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add curl \
	&& curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o $TARGET_FILE \
	&& chmod +x $TARGET_FILE \
	&& $TARGET_FILE -y 


# build 
# docker build -t hodge/alpine-rust-dev -f ./assets/docker/alpine-rust-dev.Dockerfile .

# run
# docker run --rm -it  hodge/alpine-rust-dev 

# verify in docker
# docker run --rm hodge/alpine-rust-dev rustc --version

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 