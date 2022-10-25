FROM alpine
#RUN apk add stlink --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN apk add stlink --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted

RUN apk add make gcc musl-dev libusb-dev git --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted

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

ENV BASE_URL=https://github.com/xuhaojie
ENV LIB_DIR=/usr/local

ENV LIB_NAME=STM8S_StdPeriph_Lib

ENV TARGET_DIR=$LIB_DIR/$LIB_NAME
RUN echo "install $LIB_NAME to $TARGET_DIR"
RUN git clone $BASE_URL/$LIB_NAME $TARGET_DIR

ENV LIB_NAME=STM8L10x_StdPeriph_Lib
ENV TARGET_DIR=$LIB_DIR/$LIB_NAME
RUN echo "install $LIB_NAME to $TARGET_DIR"
RUN git clone $BASE_URL/$LIB_NAME $TARGET_DIR

ENV LIB_NAME=STM8TL5x_StdPeriph_Lib
ENV TARGET_DIR=$LIB_DIR/$LIB_NAME
RUN echo "install $LIB_NAME to $TARGET_DIR"
RUN git clone $BASE_URL/$LIB_NAME $TARGET_DIR

ENV LIB_NAME=STM8L15x-16x-05x-AL31-L_StdPeriph_Lib
ENV TARGET_DIR=$LIB_DIR/$LIB_NAME
RUN echo "install $LIB_NAME to $TARGET_DIR"
RUN git clone $BASE_URL/$LIB_NAME $TARGET_DIR

# build 
# docker build -t alpine-stm8-dev -f ./assets/docker/stm8-dev.Dockerfile .
# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 