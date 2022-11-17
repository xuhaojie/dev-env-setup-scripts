FROM alpine

LABEL maintainer="xuhaojie<xuhaojie@hotmail.com>"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && apk add --update tftp-hpa

VOLUME /var/tftpboot

EXPOSE 69/udp

CMD ["/usr/sbin/in.tftpd","--foreground","--listen","--verbose", "-u", "root","--secure","/var/tftpboot"]

# build 
# docker build -t hodge/alpine-tftp-hpa -f ./assets/docker/alpine-tftp-hpa.Dockerfile .

# run
# docker run --rm --net host -dit -p 69:69/udp --name=alpine-tftp-hpa -v /tftpboot:/var/tftpboot:ro hodge/alpine-tftp-hpa

# verify in docker
#


