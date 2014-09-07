# DOCKER-VERSION 1.2.0

# Nginx Proxy
#
# Build: docker build -t proxy .
# Run: docker run -d -p 443:443 -p 80:80 --link gitlab-run:gitlab --link registry-run:registry --name proxy-run proxy
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
    DEBIAN_FRONTEND=noninteractive apt-get install -y nginx ssl-cert

ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443
CMD service nginx start