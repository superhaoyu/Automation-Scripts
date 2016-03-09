#!/bin/bash
service httpd start
service mysqld start
hostname linux_org$(date +%M%S).orange.local
service sssd start
echo "Apple1995#" | realm join -U haoyul orange.local --verbose