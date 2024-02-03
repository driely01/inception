FROM debian:11

RUN apt-get update \
    && apt-get install -y php7.4-fpm \
    && apt-get install -y php7.4-mysql wget

RUN service php7.4-fpm start

RUN mkdir -p /var/www/html

RUN sed -i 's/\/run\/php\/php7.4-fpm.sock/6000/g' /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/script.sh /

RUN chmod +x script.sh

EXPOSE 6000

ENTRYPOINT ["/script.sh"]

CMD [ "php-fpm7.4", "-F" ]