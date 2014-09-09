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
ENV APACHE_LOCK_DIR /tmp

# Add application
ADD ICEcoder-4.1.tar.gz /var/www/html
RUN sed -i 's/include/incluge/g' index.php
RUN rm /var/www/html/index.html
RUN chown www-data -R /var/www/html/lib /var/www/html/backups /var/www/html/test 
RUN mkdir /var/www/html/projects && chown -R www-data /var/www/html/projects && chmod g+s /var/www/html/projects

EXPOSE 80
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"] 
