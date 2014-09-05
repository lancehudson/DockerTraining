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
CMD ["/usr/sbin/apt-cacher-ng", "ForeGround=1", "FreshIndexMaxAge=604800"]