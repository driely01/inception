#! /bin/bash

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start
sleep 0.5

mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS db;";
mysql -u root -p -e "create user if not exists 'driss'@'%' identified by '123';";
mysql -u root -p -e "grant all privileges on db.* TO 'driss'@'%';";
mysql -u root -p -e "flush privileges;";
mysql -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '123';";
mysql -u root -p -e "flush privileges;";

kill `cat /var/run/mysqld/mysqld.pid`
sleep 1

mysqld_safe