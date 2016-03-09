#Create a pure machine with LAMP + Drupal
#!/bin/bash
curl -G https://s3.amazonaws.com/haoyu-orange/SSHD/sshd_config > /home/ec2-user/sshd_config
yum -y update
yum -y install sssd realmd krb5-workstation
echo "y" | yum install httpd  --verbose
echo "y" | yum install mysql-server  --verbose
echo "y" | yum install php php-mysql php-mbstring php-xml php-gd  php-pdo --verbose
chmod +x /home/ec2-user/sshd_config
cp /home/ec2-user/sshd_config /etc/ssh/sshd_config
service httpd start
service mysqld start
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


reboot
