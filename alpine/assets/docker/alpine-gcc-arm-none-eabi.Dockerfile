FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

# change apk source
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add gcc-arm-none-eabi

# build 
# docker build -t hodge/alpine-gcc-arm-none-eabi -f ./assets/docker/alpine-gcc-arm-none-eabi.Dockerfile .

# run
# docker run --rm -it hodge/alpine-gcc-arm-none-eabi

# verify
# docker run --rm hodge/alpine-gcc-arm-none-eabi arm-none-eabi-gcc -v

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 