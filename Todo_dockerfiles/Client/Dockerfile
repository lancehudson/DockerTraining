# DOCKER-VERSION 1.2.0
FROM ubuntu:14.04
MAINTAINER Lance Hudson <lance@lancehudson.com> (http://lancehudson.com)

RUN echo 'Acquire::http::Proxy "http://172.17.42.1:3142";' >> /etc/apt/apt.conf.d/01proxy

# Update Ubuntu
RUN \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common

# Install Nginx
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx

# Add application
ADD client /usr/src/app
ADD bower.json /usr/src/app
WORKDIR /usr/src/app

RUN bower --registry http://172.17.42.1:8080/ install

ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD service nginx start