#!/bin/sh

ver=$1

sudo apt-get update -y
sudo add-apt-repository ppa:ondrej/php -y
wget -c https://dev.mysql.com/get/mysql-apt-config_0.8.15-1_all.deb
echo "mysql-apt-config        mysql-apt-config/select-server  select  mysql-8.0" | sudo debconf-set-selections
echo "mysql-apt-config        mysql-apt-config/select-product select  Ok" | sudo debconf-set-selections
echo "mysql-apt-config        mysql-apt-config/select-tools   select  Enabled" | sudo debconf-set-selections
echo "mysql-apt-config        mysql-apt-config/select-preview select  Disabled" | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt install ./mysql-apt-config_0.8.15-1_all.deb
sudo apt-get update -y
sudo apt-get install nginx mysql-server php$ver-mysql php$ver-fpm -y