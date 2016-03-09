#!/bin/bash

yum -y update
yum install php-mbstring php-xml php-gd mysql-server httpd php php-pdo php-mysql
/etc/init.d/httpd restart
cd /var/www/html
wget http://ftp.drupal.org/files/projects/drupal-7.0.tar.gz
tar xzf drupal-7.0.tar.gz
mv drupal-7.0/* .; rm -fr drupal-7.0 drupal-7.0.tar.gz
chown -R apache.apache /var/www/html
cd /var/www/html/sites/default/
cp -p default.settings.php settings.php

mysql
mysql> create database drupal;
#Query OK, 1 row affected (0.00 sec)
mysql> CREATE USER 'haoyul'@'localhost' IDENTIFIED BY 'drupass'; #create user called haoyul with password drupass
#Query OK, 0 rows affected (0.00 sec)
mysql> grant all privileges on drupal.* to user@localhost;
#Query OK, 0 rows affected (0.00 sec)
mysql> quit
#Bye

#Use broswer to connect to the specified VM ip address and configure the website