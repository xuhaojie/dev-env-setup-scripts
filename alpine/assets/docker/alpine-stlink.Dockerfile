FROM alpine

# change apk source
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update

# install stlink
#RUN apk add stlink --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted
RUN apk add stlink

# build 
# docker build -t alpine-stlink -f ./assets/docker/alpine-stlink.Dockerfile .

# run
# docker run --rm -it --device /dev/mem:/dev/men --cap-add SYS_RAWIO alpine-stlink 

# verify in docker
# st-info --version