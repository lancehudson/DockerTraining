# NPM Lazy
#
# Build: docker build -t npm-lazy .
# Run: docker run -d -p 8080:8080 --name npm-lazy-run npm-lazy
#
# VERSION 0.0.1

FROM        ubuntu:14.04
MAINTAINER  lance@lancehudson.com

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

# Install NPM Lazy
RUN \	
    npm install -g npm_lazy

RUN \
	npm_lazy --init > ~/npm_lazy.js && \
	sed -i 's/localhost/172.17.42.1/g' ~/npm_lazy.js


WORKDIR /tmp
USER nobody
ENV HOME /tmp

EXPOSE 8080
CMD "npm_lazy", "--config ~/npm_lazy.js", "--show-config"]