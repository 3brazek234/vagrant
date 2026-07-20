#!/bin/bash

sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

sudo yum update -y
sudo yum install postgresql-server postgresql-contrib -y

sudo /usr/pgsql-18/bin/postgresql-18-setup initdb

sudo systemctl start postgresql-18
sudo systemctl enable postgresql-18

sudo -u postgres psql -c "CREATE DATABASE mydatabase;"
