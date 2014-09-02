# DOCKER-VERSION 1.2.0

# APT-CACHER
#
# Build: docker build -t apt-cacher .
# Run: docker run -d -p 3142:3142 --name apt-cacher-run apt-cacher
#
# and then you can run containers with:
#   docker run -t -i --rm -e http_proxy http://dockerhost:3142/ debian bash
#
# VERSION 0.0.1

FROM        ubuntu:14.04
MAINTAINER  lance@lancehudson.com

# Update Ubuntu
RUN \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common

# Install apt-cacher-ng
RUN \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y apt-cacher-ng

EXPOSE      3142
CMD /etc/init.d/apt-cacher-ng start && tail -f /var/log/apt-cacher-ng/*

# NPM Lazy
#
# Build: docker build -t npm-lazy .
# Run: docker run -d -p 8080:8080 --name npm-lazy-run npm-lazy
#
# VERSION 0.0.1

FROM        ubuntu:14.04
MAINTAINER  lance@lancehudson.com

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

# Install NPM Lazy
RUN \	
    npm install -y npm_lazy

WORKDIR /tmp
USER nobody

RUN npm_lazy --init > npm_lazy.config.js

EXPOSE 8080
CMD ["npm_lazy", "--config npm_lazy.config.js"]

