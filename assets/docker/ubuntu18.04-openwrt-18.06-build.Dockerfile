FROM ubuntu:18.04
# 签名
MAINTAINER xuhaojie "xuhaojie@hotmail.com"

RUN apt update

RUN apt-get install -y gcc g++ binutils patch bzip2 flex bison make autoconf gettext texinfo unzip sharutils subversion libncurses5-dev ncurses-term zlib1g-dev libssl-dev  gawk wget python git xz-utils

ENTRYPOINT ["/bin/bash"]