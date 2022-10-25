FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

# change apk source
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update

# install stlink
RUN apk add stlink

# build 
# docker build -t alpine-stlink -f ./assets/docker/alpine-stlink.Dockerfile .

# run
# docker run --rm -it --device /dev/mem:/dev/men --cap-add SYS_RAWIO alpine-stlink 

# verify in docker
# docker run --rm alpine-stlink st-info --version