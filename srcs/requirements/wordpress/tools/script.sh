#! /bin/bash

# download wp.
wp core download --path="/var/www/html" --allow-root

sleep 1

# copy content of simple config of wp into /var/www/html/wp-config.php.
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# change database name with our database name.
sed -i 's/database_name_here/'${DATABASE_NAME}'/g' /var/www/html/wp-config.php

# change username with our username.
sed -i 's/username_here/'${MYSQL_USER}'/g' /var/www/html/wp-config.php

# change password with our username password.
sed -i 's/password_here/'${MYSQL_PASSWORD}'/g' /var/www/html/wp-config.php

# change localhost with our conatiner database name.
sed -i 's/localhost/mariadb/g' /var/www/html/wp-config.php

sleep 2

# install wordpress core and provide necessary details such as
# installation path, site, url, admin, username, password, and email.
wp core install                         \
    --path="/var/www/html"              \
    --url="https://$DOMAIN_NAME"      \
    --title="WordPress Site"            \
    --admin_user="$MYSQL_USER"          \
    --admin_password="$MYSQL_PASSWORD"  \
    --admin_email="driss@gmail.com"     \
    --allow-root

# create a new user with the subscriber role.
wp user create                      \
    $SIMPLE_USER                    \
    del-yaag@gmail.com              \
    --role="subscriber"             \
    --user_pass="$SIMPLE_PASSWORD"  \
    --path="/var/www/html"          \
    --allow-root

# start php fastcgi process manager in foreground mode
php-fpm7.4 -F