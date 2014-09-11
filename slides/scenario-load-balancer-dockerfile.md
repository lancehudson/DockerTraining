##  Scenario - Load Balancer - Dockerfile
    FROM ubuntu:14.04

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
