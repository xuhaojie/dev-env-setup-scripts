FROM alpine:3.15

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ARG TARGET_FILE=/etc/ssh/sshd_config

# change apk source   libuser
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add openrc openssh-server gcompat libstdc++ bash \ 
	&& sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/g' $TARGET_FILE \
	&& sed -i 's/#PermitTunnel no/PermitTunnel yes/g' $TARGET_FILE \
	&& echo "|--> Install basics pre-requisites" \
	&& apk add --no-cache curl ca-certificates python3 py3-pip \
	&& echo "|--> Install Python basics" \
	&& pip3 config set global.index-url http://pypi.douban.com/simple \
	&& pip3 config set install.trusted-host pypi.douban.com \	
	&& pip3 --no-cache-dir install --upgrade pip setuptools wheel \
	&& echo "|--> Install Python packages" \
	&& pip3 install pytorch \
	&& echo "|--> Cleaning" \
	&& rm /usr/include/xlocale.h \
	&& rm -rf /root/.cache \
	&& rm -rf /root/.[acpw]* \ 
	&& rm -rf /var/cache/apk/* \
	&& find /usr/lib/python3.8 -name __pycache__ | xargs rm -r

#	&& apk add --no-cache --virtual=.build-deps build-base linux-headers python3-dev git cmake jpeg-dev bash libffi-dev gfortran openblas-dev py-numpy-dev freetype-dev libpng-dev \

# build 
# docker build -t hodge/alpine-pytorch-dev -f ./assets/docker/alpine-pytorch-dev.Dockerfile .

# run
# docker run --rm -it  hodge/alpine-pytorch-dev 

# verify in docker
# docker run --rm --it hodge/alpine-pytorch-dev 

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 

# import torch
# x = torch.rand(5, 3)
# print(x)