FROM debian:11

# update package manager and install php-fpm and php-mysql and wget
RUN apt-get update \
    && apt-get install -y php7.4-fpm \
    && apt-get install -y php7.4-mysql wget

# start php-fpm service
RUN service php7.4-fpm start

# create /var/www/html directory
RUN mkdir -p /var/www/html

# change run/php/php7.4-fpm.sock with 6000 in config file of php-fpm config file
RUN sed -i 's/\/run\/php\/php7.4-fpm.sock/6000/g' /etc/php/7.4/fpm/pool.d/www.conf

# copy the script into container root directory
COPY tools/script.sh /

# add execute permission to the script
RUN chmod +x script.sh

# expose port 6000
EXPOSE 6000

# run the script at the running container
ENTRYPOINT ["/script.sh"]

# start php fastcgi process manager in foreground mode
CMD [ "php-fpm7.4", "-F" ]