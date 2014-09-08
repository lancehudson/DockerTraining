# DOCKER-VERSION 1.2.0
FROM ubuntu:14.04
MAINTAINER Lance Hudson <lance@lancehudson.com> (http://lancehudson.com)

RUN echo 'Acquire::http::Proxy "http://172.17.42.1:3142";' >> /etc/apt/apt.conf.d/01proxy

# Update Ubuntu
RUN \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common

# Install Apache & PHP
RUN \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 php5 libapache2-mod-php5

# Configure Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Add application
ADD ICEcoder-4.1.tar.gz /var/www
RUN chown www-data -R /var/www/lib /var/www/backups /var/www/test 
RUN mkdir /var/www/projects && chown -R www-data /var/www/projects && chmod g+s /var/www/projects

EXPOSE 80
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"] 