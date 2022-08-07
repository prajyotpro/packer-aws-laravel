#!/bin/bash

sudo apt install unzip -y
cd /home/ubuntu/ && unzip heady-api-doc.zip
sudo mv heady-api-doc /var/www/

sudo cp nginx.conf /etc/nginx/sites-enabled/default

cd /var/www/heady-api-doc
composer install
composer update

npm install
npm run build

sudo chown -R www-data.www-data /var/www/heady-api-doc/storage
sudo chown -R www-data.www-data /var/www/heady-api-doc/bootstrap/cache

sudo systemctl restart nginx
