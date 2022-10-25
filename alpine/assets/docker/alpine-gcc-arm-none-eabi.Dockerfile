FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

#ENV DEBIAN_FRONTEND=noninteractive

#ENV TZ=Etc/UTC

#RUN apk add gcc-arm-none-eabi --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted

# change apk source
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update

# install package
RUN apk add gcc-arm-none-eabi

# build 
# docker build -t alpine-gcc-arm-none-eabi -f ./assets/docker/alpine-gcc-arm-none-eabi.Dockerfile .

# run
# docker run --rm -it alpine-gcc-arm-none-eabi

# verify
# arm-none-eabi-gcc -v

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 