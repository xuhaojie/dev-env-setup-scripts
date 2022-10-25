FROM alpine

# change apk source
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update

#RUN apk add gcompat --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted
#RUN apk add gcompat
#apk add gcompat libstdc++6 libuser

ENV PKG_URL=https://sourceforge.net/projects/sdcc/files/sdcc-linux-amd64/4.2.0/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2
ENV PKG_FILE=/tmp/sdcc-4.2.0-amd64-unknown-linux2.5.tar.bz2

RUN echo "download stlink install package"
RUN wget $PKG_URL -O $PKG_FILE

RUN tar xvf $PKG_FILE -C /opt

RUN rm $PKG_FILE

ENV TARGET_FILE=/etc/profile

RUN echo export PATH="/opt/sdcc-4.2.0/bin:\$PATH" | tee -a $TARGET_FILE

RUN source $TARGET_FILE

#RUN apk add stlink --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted

#RUN apk add make gcc musl-dev libusb-dev git --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted

# build 
# docker build -t alpine-sdcc -f ./assets/docker/alpine-sdcc.Dockerfile .

# run
# docker run --rm -it alpine-sdcc

# verify in docker
# sdcc -v

# 清理已经停止的容器. 
# docker rm -v $(docker ps --all --quiet --filter 'status=exited') 