##  Hello World - Dockerfile

    # DOCKER-VERSION 1.2.0
    FROM ubuntu:14.04
    MAINTAINER Lance Hudson <lance@lancehudson.com> (http://lancehudson.com)

    # Add Apt Cacher Proxy
    RUN echo 'Acquire::http::Proxy "http://172.17.42.1:3142";' | \
        tee -a /etc/apt/apt.conf.d/01proxy

    # Update Ubuntu
    RUN \
        apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
        software-properties-common
<!-- .element: class="bash" -->

    # Install NodeJS
    RUN \
        DEBIAN_FRONTEND=noninteractive add-apt-repository \
        ppa:chris-lea/node.js && \
        apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y nodejs

    # Add application
    ADD . /usr/src/app
    WORKDIR /usr/src/app
    USER nobody

    EXPOSE 8080
    CMD ["node", "server.js"]
<!-- .element: class="bash" -->

note:

why multiline?
