#!/bin/bash

sleep 30

sudo apt update -y
sudo apt install nginx -y
sudo ufw allow 'Nginx HTTP'
sudo ufw allow 'Nginx HTTPS'