FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"
ARG PKG_URL=https://jaist.dl.sourceforge.net/project/sdcc/sdcc-linux-amd64/4.2.0/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2
#ARG PKG_URL=https://sourceforge.net/projects/sdcc/files/sdcc-linux-amd64/4.2.0/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2
ARG PKG_FILE=/tmp/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2
ARG TARGET_FILE=/etc/profile
ARG TARGET_DIR=/tmp/stm8flash

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add openrc openssh-server gcompat libstdc++ bash gcompat libstdc++ make gcc musl-dev libusb-dev libusb git \
	&& sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/g' /etc/ssh/sshd_config \
	&& sed -i 's/#PermitTunnel no/PermitTunnel yes/g' /etc/ssh/sshd_config	\	
	&& wget $PKG_URL -O $PKG_FILE 	&& tar xvf $PKG_FILE -C /opt \
	&& rm $PKG_FILE \
	&& echo "export PATH=/opt/sdcc-4.2.0/bin:\$PATH" | tee -a /etc/profile \
	&& git clone https://github.com/vdudouyt/stm8flash.git $TARGET_DIR \
	&& cd $TARGET_DIR \
	&& make \
	&& make install \
	&& apk del -r gcc musl-dev libusb-dev \
	&& cd / \
	&& rm -rf $TARGET_DIR
ENV   PATH=$PATH:/opt/sdcc-4.2.0/bin

# build 
# docker build -t hodge/alpine-stm8-dev -f ./assets/docker/alpine-stm8-dev.Dockerfile .

# run
# docker run --rm -it --privileged hodge/alpine-stm8-dev 

# verify in docker
# docker run --rm hodge/alpine-stm8-dev stm8flash -V

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 