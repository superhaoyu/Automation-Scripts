#!/bin/bash
curl -G https://s3.amazonaws.com/haoyu-orange/SSHD/sshd_config > /home/ec2-user/sshd_config
hostname linux_org$(date +%M%S).orange.local
yum -y update
yum -y install sssd realmd krb5-workstation
echo "y" | yum install httpd  --verbose
service httpd start
echo "y" | yum install mysql-server  --verbose
service mysqld start
echo "y" | yum install php php-mysql --verbose
echo "Apple1995#" | realm join -U haoyul orange.local --verbose
chmod +x /home/ec2-user/sshd_config
cp /home/ec2-user/sshd_config /etc/ssh/sshd_config
service sssd start
reboot
