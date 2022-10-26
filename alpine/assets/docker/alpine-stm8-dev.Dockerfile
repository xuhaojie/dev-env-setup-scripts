FROM hodge/alpine-sdcc

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ARG BASE_URL=https://github.com/xuhaojie
ARG LIB_DIR=/usr/local/

RUN apk add git \
	&& git clone $BASE_URL/STM8S_StdPeriph_Lib $LIB_DIR/STM8S_StdPeriph_Lib \
	&& git clone $BASE_URL/STM8L10x_StdPeriph_Lib $LIB_DIR/STM8L10x_StdPeriph_Lib \
	&& git clone $BASE_URL/STM8TL5x_StdPeriph_Lib $LIB_DIR/STM8TL5x_StdPeriph_Lib \
	&& git clone $BASE_URL/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib $LIB_DIR/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib

# build 
# docker build -t hodge/alpine-stm8-dev -f ./assets/docker/alpine-stm8-dev.Dockerfile .

# run
# docker run --rm -it --device /dev/mem:/dev/men --cap-add SYS_RAWIO hodge/alpine-stm8-dev 

# verify in docker
# docker run --rm hodge/alpine-stm8-dev stm8flash  -V && sdcc -v
# ls /usr/local/STM8L10x_StdPeriph_Lib
# ls /usr/local/STM8S_StdPeriph_Lib
# ls /usr/local/STM8L15x-16x-05x-AL31-L_StdPeriph_Lib
# ls /usr/local/STM8TL5x_StdPeriph_Lib

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 