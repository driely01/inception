# install the offecial debin base image
FROM debian:11

# update the package manager list and install php-fpm
RUN apt-get update \
    && apt-get install -y php7.4-fpm \
    && apt-get install -y php7.4-mysql \
    && apt-get install curl -y


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# start php-fpm
RUN service php7.4-fpm start
RUN chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html

RUN sed -i 's/\/run\/php\/php7.4-fpm.sock/9000/g' /etc/php/7.4/fpm/pool.d/www.conf
RUN wp core download --path="/var/www/html" --allow-root

COPY tools/*.sh /

EXPOSE 9000

CMD ["./script.sh"]