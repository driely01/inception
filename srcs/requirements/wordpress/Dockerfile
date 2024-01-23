# install the offecial debin base image
FROM debian:11

# update the package manager list and install php-fpm
RUN apt-get update \
    && apt-get install -y php7.4-fpm

# start php-fpm
RUN service php7.4-fpm start

RUN mkdir -p /mysite

RUN sed -i 's/\/run\/php\/php7.4-fpm.sock/9000/g' /etc/php/7.4/fpm/pool.d/www.conf
COPY index.php /mysite

EXPOSE 9000

CMD ["php-fpm7.4", "-F"]
