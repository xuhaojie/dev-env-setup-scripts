FROM alpine-gcc-arm-none-eabi

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

RUN apk add stlink gcc-arm-none-eabi openocd --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted

# build 
# docker build -t alpine-stm32-dev -f ./assets/docker/alpine-stm32-dev.Dockerfile .

# run
# docker run --rm -it --device /dev/mem:/dev/men --cap-add SYS_RAWIO alpine-stm32-dev 

# verify in docker
# docker run --rm -it alpine-stm32-dev st-info

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 