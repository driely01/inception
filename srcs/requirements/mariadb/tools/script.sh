#! /bin/bash

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start
sleep 0.5

mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;";
mysql -u root -p -e "create user if not exists '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';";
mysql -u root -p -e "grant all privileges on $DATABASE_NAME.* TO '$MYSQL_USER'@'%';";
mysql -u root -p -e "flush privileges;";
mysql -u root -p -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';";
mysql -u root -p -e "flush privileges;";

kill `cat /var/run/mysqld/mysqld.pid`
sleep 1

mysqld_safe