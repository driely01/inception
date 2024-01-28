#! /bin/bash

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i 's/database_name_here/db/g' /var/www/html/wp-config.php
sed -i 's/username_here/driss/g' /var/www/html/wp-config.php
sed -i 's/password_here/123/g' /var/www/html/wp-config.php
sed -i 's/localhost/mariadb/g' /var/www/html/wp-config.php
sleep 2.5
wp core install --path="/var/www/html" --url="https://10.11.100.34" --title="YourSiteTitle" --admin_user="$MYSQL_USER" --admin_password="$MYSQL_PASSWORD" --admin_email="driss@gmail.com" --allow-root
wp user create del-yaag del-yaag@gmail.com --role="editor" --user_pass="1234" --path="/var/www/html" --allow-root

php-fpm7.4 -F