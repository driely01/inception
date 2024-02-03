#!bin/sh
mkdir -p /var/www/html/adminer && \
wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer/index.php && \
chmod +x /var/www/html/adminer/index.php
exec "$@"