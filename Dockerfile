FROM node:10.13-alpine

LABEL maintainer="Dario Vogogna <d.vogogna@vargroup.it>"
LABEL tools="git node npm yarn"

# Latest versions 1.7.4, 6.2.6, 7.1.0
ARG VERSION=7.1.0

RUN apk update \
    && apk upgrade \
    && apk add --update alpine-sdk git chromium \
    && apk del alpine-sdk \
    && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
    && npm cache verify \
    && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

RUN yarn global add @angular/cli@$VERSION

RUN mkdir -p /usr/src/app

EXPOSE 4200

WORKDIR /usr/src/app
