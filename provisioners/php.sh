#!/bin/bash

sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y

sudo apt update -y
sudo apt install php8.0-fpm -y

sudo apt install php8.0-cli -y
sudo apt install php8.0-bcmath -y
sudo apt install php8.0-ctype -y
sudo apt install php8.0-curl -y
sudo apt install php8.0-xml -y
sudo apt install php8.0-mbstring -y
sudo apt install php8.0-gd -y
sudo apt install php8.0-memcached -y
sudo apt install php8.0-imap -y
sudo apt install php8.0-mysql -y
sudo apt install php8.0-xml -y
sudo apt install php8.0-zip -y
sudo apt install php8.0-soap -y
sudo apt install php8.0-intl -y
sudo apt install php8.0-readline -y
sudo apt install php8.0-pcov -y
sudo apt install php8.0-msgpack -y
sudo apt install php8.0-igbinary -y
sudo apt install php8.0-ldap -y
sudo apt install php8.0-redis -y
sudo apt install php8.0-swoole -y

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/local/bin/composer

sudo systemctl restart nginx