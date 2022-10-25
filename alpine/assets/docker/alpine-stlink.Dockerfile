FROM alpine
#RUN apk add stlink --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN apk add stlink --update-cache --repository http://mirrors.ustc.edu.cn/alpine/v3.16/main --allow-untrusted

# build 
# docker build -t alpine-stlink -f ./assets/docker/alpine-stlink.Dockerfile .
