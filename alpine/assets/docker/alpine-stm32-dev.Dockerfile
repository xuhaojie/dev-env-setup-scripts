FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add gcc-arm-none-eabi stlink openocd --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted

# build 
# docker build -t hodge/alpine-stm32-dev -f ./assets/docker/alpine-stm32-dev.Dockerfile .

# run
# docker run --rm -it --privileged hodge/alpine-stm32-dev 

# verify in docker
# docker run --rm -it hodge/alpine-stm32-dev st-info

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 
