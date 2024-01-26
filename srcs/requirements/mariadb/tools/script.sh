#! /bin/bash

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS db;" > dbInfo
echo "create user 'driss'@'%' identified by '123';" >> dbInfo
echo "grant all privileges on db.* TO 'driss'@'%';" >> dbInfo
echo "flush privileges;" >> dbInfo
mariadb < dbInfo

# mysql -u root -p -e "alter user 'root'@'localhost' identified by '123';"
# mysql -u root -p -e "FLUSH PRIVILEGES;"

# kill `cat /var/run/mysqld/mysqld.pid`

mysqld