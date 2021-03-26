FROM node:alpine

LABEL maintainer="Dario Vogogna <stein.dario@gmail.com>"
LABEL tools="node npm angular"

RUN npm install -g @angular/cli

RUN mkdir -p /app

EXPOSE 4200

WORKDIR /app
