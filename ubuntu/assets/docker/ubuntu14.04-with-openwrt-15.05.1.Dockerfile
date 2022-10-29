FROM  hodge/ubuntu14.04-openwrt-15.05.1-build

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ADD openwrt-15.05.1.tar.bzip2 /home/op/

WORKDIR /home/op/openwrt-15.05.1/

ENTRYPOINT ["/bin/bash"]

# build 
# docker build -t hodge/ubuntu14.04-with-openwrt-15.05.1 -f ./assets/docker/ubuntu14.04-with-openwrt-15.05.1.Dockerfile .

# run
# docker run --rm -it hodge/ubuntu14.04-with-openwrt-15.05.1

# verify
#
