# presentation
#
# Build: docker build -t presentation .
# Run: docker run -d -p 9000:9000 --name presentation-run presentation
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
    DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs git

# Add presentation
ADD . /usr/src/app
WORKDIR /usr/src/app

# Install NPM
RUN \
    npm install -g bower grunt-cli && \
    npm install && \
    bower --allow-root install

USER nobody

EXPOSE 9000
CMD grunt server
