# DOCKER-VERSION 1.2.0
FROM ubuntu:14.04
MAINTAINER Lance Hudson <lance@lancehudson.com> (http://lancehudson.com)

RUN echo 'Acquire::http::Proxy "http://172.17.42.1:3142";' >> /etc/apt/apt.conf.d/01proxy

# Update Ubuntu
RUN \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common

# Install NodeJS
RUN \
    DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:chris-lea/node.js && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

# Add application
ADD . /usr/src/app
WORKDIR /usr/src/app

RUN npm --registry http://172.17.42.1:8080/ install

USER nobody

EXPOSE 8000
CMD ["node", "."]
