FROM  hodge/ubuntu14.04-openwrt-15.05.1-build

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

ADD wifibox-openwrt-15.05.1.tar.bzip2 /home/op/

WORKDIR /home/op/wifibox-openwrt-15.05.1/

ENTRYPOINT ["/bin/bash"]

# build 
# docker build -t hodge/ubuntu14.04-wifibox-openwrt-15.05.1 -f ./assets/docker/ubuntu14.04-wifibox-openwrt-15.05.1.Dockerfile .

# run
# docker run --rm --net host -dit -p 69:69/udp --name=alpine-tftp-hpa -v /tftpboot:/var/tftpboot:ro hodge/alpine-tftp-hpa
# docker run --rm -it --cpus=12 -v /tmp/dockertmp:/tmp hodge/ubuntu14.04-wifibox-openwrt-15.05.1

# verify
#
