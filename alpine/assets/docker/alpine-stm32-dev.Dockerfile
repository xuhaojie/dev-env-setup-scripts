FROM hodge/alpine-gcc-arm-none-eabi

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

RUN apk add stlink openocd --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted

# build 
# docker build -t hodge/alpine-stm32-dev -f ./assets/docker/alpine-stm32-dev.Dockerfile .

# run
# docker run --rm -it --device /dev/stlinkv2_4 --device /dev/ttyUSB0 hodge/alpine-stm32-dev 
# docker run --rm -it --device /dev/stlinkv2_4 --device /dev/ttyUSB0:/dev/ttyUSB0 hodge/alpine-stm32-dev 

# verify in docker
# docker run --rm -it hodge/alpine-stm32-dev st-info

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 
