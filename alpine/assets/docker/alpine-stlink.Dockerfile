FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

# change apk source
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add stlink

# build 
# docker build -t hodge/alpine-stlink -f ./assets/docker/alpine-stlink.Dockerfile .

# run
# docker run --rm -it --device /dev/stlinkv2_4 hodge/alpine-stlink 

# verify in docker
# docker run --rm hodge/alpine-stlink st-info --version