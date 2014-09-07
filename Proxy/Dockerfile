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
    DEBIAN_FRONTEND=noninteractive apt-get install -y nginx

ADD ssl-cert-snakeoil.pem /etc/ssl/certs/ssl-cert-snakeoil.pem
ADD ssl-cert-snakeoil.key /etc/ssl/private/ssl-cert-snakeoil.key

ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443
CMD service nginx start