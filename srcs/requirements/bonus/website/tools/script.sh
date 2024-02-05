#! /bin/bash

mkdir -p /var/www/html

mv sites /var/www/html/

exec "$@"