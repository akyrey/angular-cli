FROM node:lts-slim

LABEL maintainer="Dario Vogogna <d.vogogna@vargroup.it>"
LABEL tools="git node npm yarn"

# Latest versions 1.7.4, 6.2.6, 7.1.0
ARG VERSION=7.1.0

RUN apt update \
    && apt upgrade -y \
    && apt install -y git chromium \
    && rm -rf /tmp/* /var/cache/apt/* *.tar.gz ~/.npm \
    && npm cache verify

RUN yarn global add @angular/cli@$VERSION

RUN yarn config set network-timeout 100000 -g

RUN mkdir -p /usr/src/app

EXPOSE 4200

WORKDIR /usr/src/app
