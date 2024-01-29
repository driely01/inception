#! /bin/bash

mkdir -p /var/www/html

mv sites /var/www/html/
# mv devlove /var/www/html/

exec "$@"