#!bin/sh
wget "http://www.adminer.org/latest.php" -O /var/www/html/index.php
exec "$@"