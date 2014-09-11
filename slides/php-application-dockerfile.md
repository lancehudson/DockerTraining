##  PHP Application - Dockerfile
    # DOCKER-VERSION 1.2.0
    FROM ubuntu:14.04
    MAINTAINER Lance Hudson <lance@lancehudson.com> (http://lancehudson.com)

    # Update Ubuntu
    RUN \
        apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
        software-properties-common
<!-- .element: class="bash" -->

    # Install Apache & PHP
    RUN \
        DEBIAN_FRONTEND=noninteractive apt-get install -y \
        apache2 php5 libapache2-mod-php5

    # Add application
    ADD ICEcoder-4.1.tar.gz /var/www/html
    RUN sed -i 's/include/incluge/g' /var/www/html/index.php
    RUN rm /var/www/html/index.html
    RUN chown www-data -R /var/www/html

    EXPOSE 80
    CMD /etc/init.d/apache2 start && tail -f \
        /var/log/apache2/*.log
<!-- .element: class="bash" -->
