FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

# change apk source
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update \
	&& apk add argp-standalone asciidoc bash bc binutils bzip2 cdrkit coreutils diffutils \
	findutils flex fts-dev g++ gawk gcc gettext git grep intltool \
	libxslt linux-headers make musl-libintl musl-obstack-dev ncurses-dev \
	openssl-dev patch perl python3-dev rsync tar unzip \
	util-linux wget zlib-dev \
	&& ln -s /usr/lib/libncurses.so /usr/lib/libtinfo.so 

# build 
# docker build -t alpine-openwrt-15.5.01-build -f ./assets/docker/alpine-openwrt-15.5.01-build.Dockerfile .

# run
# docker run --rm -it alpine-openwrt-15.5.01-build

# verify in docker
# docker run --rm alpine-openwrt-15.5.01-build /bin/ash

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 