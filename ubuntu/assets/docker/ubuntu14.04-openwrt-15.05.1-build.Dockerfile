FROM ubuntu:14.04

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

RUN apt-get update

RUN apt-get install -y gcc g++ binutils patch bzip2 flex bison make autoconf gettext texinfo unzip sharutils subversion libncurses5-dev ncurses-term zlib1g-dev libssl-dev  gawk wget python git xz-utils

ENTRYPOINT ["/bin/bash"]

# build 
# docker build -t ubuntu14.04-openwrt-15.05.1-build -f ./assets/docker/ubuntu14.04-openwrt-15.05.1-build.Dockerfile .

# run
# docker run --rm -it ubuntu14.04-openwrt-15.05.1-build

# verify
#
