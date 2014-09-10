##  Scenario - Load Balancer - Dockerfile
    FROM ubuntu:14.04

    RUN echo 'Acquire::http::Proxy "http://172.17.42.1:3142";' \
    >> /etc/apt/apt.conf.d/01proxy

    RUN \
        apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
        software-properties-common
<!-- .element: class="bash" -->

    RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx

    ADD nginx.conf /etc/nginx/nginx.conf

    EXPOSE 80
    CMD service nginx start
<!-- .element: class="bash" -->
