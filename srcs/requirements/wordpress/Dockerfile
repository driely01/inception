# install the offecial debin base image
FROM debian:11

# update the package manager list and install php-fpm
RUN apt-get update \
    && apt-get install -y php7.4-fpm

# remove the php file from /var/run/
RUN rm -rf /var/run/php

# run the php-fpm server
RUN service php7.4-fpm start

CMD ['php7.4-fpm', '-F']