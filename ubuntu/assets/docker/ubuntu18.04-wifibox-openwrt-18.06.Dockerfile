FROM  hodge/ubuntu18.04-openwrt-18.06-build

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ADD wifibox-openwrt-18.06.tar.bzip2 /home/op/

WORKDIR /home/op/openwrt-18.06/

ENTRYPOINT ["/bin/bash"]

# build 
# docker build -t hodge/ubuntu18.04-wifibox-openwrt-18.06 -f ./assets/docker/ubuntu18.04-wifibox-openwrt-18.06.Dockerfile .

# run
# docker run --rm -it hodge/ubuntu18.04-wifibox-openwrt-18.06

# verify
#
