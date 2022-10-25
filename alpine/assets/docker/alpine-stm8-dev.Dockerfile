FROM alpine-sdcc

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

#RUN apk add stlink --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted
#RUN apk add stlink
RUN apk add git

ARG BASE_URL=https://github.com/xuhaojie
ARG LIB_DIR=/usr/local

ARG LIB_NAME=STM8S_StdPeriph_Lib

ARG TARGET_DIR=$LIB_DIR/$LIB_NAME
RUN echo "install $LIB_NAME to $TARGET_DIR"
RUN git clone $BASE_URL/$LIB_NAME $TARGET_DIR

ARG LIB_NAME=STM8L10x_StdPeriph_Lib
ARG TARGET_DIR=$LIB_DIR/$LIB_NAME
RUN echo "install $LIB_NAME to $TARGET_DIR"
RUN git clone $BASE_URL/$LIB_NAME $TARGET_DIR

ARG LIB_NAME=STM8TL5x_StdPeriph_Lib
ARG TARGET_DIR=$LIB_DIR/$LIB_NAME
RUN echo "install $LIB_NAME to $TARGET_DIR"
RUN git clone $BASE_URL/$LIB_NAME $TARGET_DIR

ARG LIB_NAME=STM8L15x-16x-05x-AL31-L_StdPeriph_Lib
ARG TARGET_DIR=$LIB_DIR/$LIB_NAME
RUN echo "install $LIB_NAME to $TARGET_DIR"
RUN git clone $BASE_URL/$LIB_NAME $TARGET_DIR

# build 
# docker build -t alpine-stm8-dev -f ./assets/docker/alpine-stm8-dev.Dockerfile .

# run
# docker run --rm -it --device /dev/mem:/dev/men --cap-add SYS_RAWIO alpine-stm8-dev 

# verify in docker
# docker run --rm alpine-stm8-dev stm8flash  -V
# docker run --rm alpine-stm8-dev sdcc -v
# ls /usr/local/STM8L10x_StdPeriph_Lib
# ls /usr/local/STM8S_StdPeriph_Lib
# ls /usr/local/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib
# ls /usr/local/STM8TL5x_StdPeriph_Lib

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 