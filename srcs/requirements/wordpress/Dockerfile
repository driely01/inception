# install the offecial debin base image
FROM debian:11

# update the package manager list and install php-fpm
RUN apt-get update \
    && apt-get install -y php7.4-fpm \
    && apt-get install -y php7.4-mysql \
    && apt-get install curl -y

# install wp-cli using curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# start php-fpm
RUN service php7.4-fpm start

# add execute permission to wp-cli.phar and replace it into /usr/local/bin/wp
RUN chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# create a directory /var/www/html
RUN mkdir -p /var/www/html

# replace run/php/php7.4-fpm.sock with 9000 in www.conf (php-fpm config file)
RUN sed -i 's/\/run\/php\/php7.4-fpm.sock/9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# copy script to the root of our container
COPY tools/script.sh /

# add execute permissiong to the script
RUN chmod +x script.sh

# expose port 9000 to the container
EXPOSE 9000

# run the script when the conatiner start running
CMD ["./script.sh"]