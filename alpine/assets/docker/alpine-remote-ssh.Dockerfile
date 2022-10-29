FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ARG TARGET_FILE=/etc/ssh/sshd_config

# change apk source   libuser
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add openrc openssh-server gcompat libstdc++ bash \ 
	&& sed -i 's/AllowTcpForwarding no/AllowTcpForwarding yes/g' $TARGET_FILE \
	&& sed -i 's/#PermitTunnel no/PermitTunnel yes/g' $TARGET_FILE
	#&& rc-update add sshd 
	#&& service sshd restart

RUN adduser -h /home/vscode -D -s /bin/bash vscode \
	&& passwd -d vscode

USER vscode

WORKDIR /home/vscode/

# build 
# docker build -t hodge/alpine-remote-ssh -f ./assets/docker/alpine-remote-ssh.Dockerfile .

# run
# docker run --rm -it hodge/alpine-remote-ssh

# verify in docker
# docker run --rm hodge/alpine-remote-ssh /bin/bash