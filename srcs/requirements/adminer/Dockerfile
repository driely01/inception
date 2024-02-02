FROM debian:stable

RUN apt-get update \
    && apt-get install -y php8.2-fpm \
    && apt-get install -y php php-mysql wget

RUN service php8.2-fpm start

RUN mkdir -p /var/www/html

RUN sed -i 's/\/run\/php\/php8.2-fpm.sock/8080/g' /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/script.sh /

RUN chmod +x script.sh

ENTRYPOINT ["/script.sh"]

CMD [ "php-fpm8.2", "-F" ]