#!/bin/bash

echo "Welcome to the jel.ly installer"
echo "Do you want a reverse proxy installed with a working config? y/N"
read varname
echo ""
echo ""
echo "Installing dependencies and Upgrading System"
echo ""
apt update -s
apt upgrade -y
apt install -y screen
apt install -y npm
apt install -y nodejs
apt install -y git
apt install -y software-properties-common
apt install -y nano
if [ $varname = "y" ];
then
apt install -y nginx
systemctl start nginx
systemctl enable nginx
rm /etc/nginx/conf.d/default.conf
rm /etc/nginx/sites-enabled/default
wget https://aspriddell.github.io/jel.ly/installer-src/default.conf -P /etc/nginx/conf.d
nginx -s reload
echo ""
echo ""
echo "Do you want to enable SSL For Free, Provided by Lets Encrypt? y/N"
read varname1
if [ $varname1 = "y" ];
then
sudo add-apt-repository ppa:certbot/certbot
sudo apt update
sudo apt install -y python-certbot-nginx
echo ""
echo "The Let\"s Encrypt Configurator will now load. Please fill out the details correctly"
echo ""
certbot --nginx
fi
fi
echo "Installing jelly server"
cd
wget https://aspriddell.github.io/jel.ly/installer-src/startserver.sh
git clone https://github.com/aspriddell/jel.ly.git
cd jel.ly
npm install -g gulp
npm install
echo ""
echo "Setup Complete. The module screen has been installed. If you are planing on having an always on server run:"
echo ""
echo "screen -t jelly"
echo "sudo bash startserver.sh"
echo ""
echo ""
echo "If you configured Let's Encrypt. Run sudo crontab -e and paste: 0 0 1 * * certbot renew"
echo "at the bottom"

