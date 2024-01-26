#! /bin/bash


# start php-fpm
# service php7.4-fpm start

# mkdir -p /var/www/html

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# chmod +x wp-cli.phar

# mv wp-cli.phar /usr/local/bin/wp


# sed -i 's/\/run\/php\/php7.4-fpm.sock/9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# touch /var/www/html/wp-config.php

# wp core download --path="/var/www/html" --allow-root
# wp config create --path="/var/www/html" --dbname="db" --dbuser="driss" --dbpass="123" --dbhost="mariadb" --allow-root
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i 's/database_name_here/db/g' /var/www/html/wp-config.php
sed -i 's/username_here/driss/g' /var/www/html/wp-config.php
sed -i 's/password_here/123/g' /var/www/html/wp-config.php
sed -i 's/localhost/mariadb/g' /var/www/html/wp-config.php
wp core install --path="/var/www/html" --url="https://10.11.100.34" --title="YourSiteTitle" --admin_user="driss" --admin_password="123" --admin_email="driss@gmail.com" --allow-root

php-fpm7.4 -F