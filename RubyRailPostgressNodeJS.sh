#!/bin/bash
yum install ruby rubygems rails
gem update --system 
yum install nodejs npm --enablerepo=epel
yum install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
service postgresql initdb
service postgresql start

su - postgres
psql
CREATE USER haoyul superuser;
ALTER USER haoyul WITH PASSWORD 'Apple1995#';
CREATE DATABASE NODEJS WITH OWNER haoyul;
