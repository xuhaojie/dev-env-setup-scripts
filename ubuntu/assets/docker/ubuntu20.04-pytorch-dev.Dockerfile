
FROM ubuntu:20.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

WORKDIR /root

RUN apt update \
    && apt-get install -y tzdata \
    && ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata \
	&& apt install -y python3 python3-pip apt-utils apt-transport-https ca-certificates curl gnupg-agent software-properties-common \
    && apt-get clean \
	&& pip3 config set global.index-url http://pypi.douban.com/simple \
	&& pip3 config set install.trusted-host pypi.douban.com \
	&& pip3 config list \
	&& pip3 install pip -U \
	&& pip3 install torch torchvision torchaudio
	
	 #-i https://pypi.tuna.tsinghua.edu.cn/simple
	

ENTRYPOINT ["/bin/bash"]

# build 
# docker build -t hodge/ubuntu20.04-pytorch-dev -f ./assets/docker/ubuntu20.04-pytorch-dev.Dockerfile .

# run
# docker run --rm -it hodge/ubuntu20.04-pytorch-dev

# verify
# docker run --rm -it hodge/ubuntu20.04-pytorch-dev phton3

# import torch
# x = torch.rand(5, 3)
# print(x)
