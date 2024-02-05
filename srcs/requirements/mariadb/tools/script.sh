#! /bin/bash

# change localhost ip address host with default ip address (0.0.0.0) in the config of mariadb
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# start mariadb service
service mariadb start
sleep 0.5

# create a database and user and give it all privileges then set the root password
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;";
mysql -u root -p -e "create user if not exists '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';";
mysql -u root -p -e "grant all privileges on $DATABASE_NAME.* TO '$MYSQL_USER'@'%';";
mysql -u root -p -e "flush privileges;";
mysql -u root -p -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';";
mysql -u root -p -e "flush privileges;";

# kill the process of mariadb
kill `cat /var/run/mysqld/mysqld.pid`
sleep 1

# start the mysql server in safe mode
mysqld_safe