# DOCKER-VERSION 1.2.0

# Nginx Proxy
#
# Build: docker build -t loadbalancer .
# Run: docker run -d -p 80:80 --link client-run:client --link service-run:service --name loadbalancer-run loadbalancer
#
# VERSION 0.0.1

FROM        ubuntu:14.04
MAINTAINER  lance@lancehudson.com

# Update Ubuntu
RUN \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common

# Install nginx
RUN \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y nginx

ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD service nginx start