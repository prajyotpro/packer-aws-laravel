#!/bin/bash

cd /home/ubuntu

wget https://deb.nodesource.com/setup_16.x
chmod +x setup_16.x
sudo ./setup_16.x

sudo apt install nodejs -y
