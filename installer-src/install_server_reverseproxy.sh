#!/bin/bash
# Ask the user for their name
echo Welcome to the jel.ly installer
echo Do you want to have a reverse proxy installed with a config? y/N
read varname
echo Installing dependencies
apt update
apt install -y screen
apt install -y npm
apt install -y nodejs
apt install -y git
if [ $varname = "y" ];
then
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx
rm /etc/nginx/conf.d/default.conf
rm /etc/nginx/sites-enabled/default
wget https://aspriddell.github.io/jel.ly/installer-src/default.conf -P /etc/nginx/conf.d
nginx -s reload
fi

cd
wget https://aspriddell.github.io/jel.ly/installer-src/startserver.sh
git clone https://github.com/aspriddell/jel.ly.git
cd jel.ly
npm install -g gulp
npm install

echo "Setup Complete. The module screen has been installed. If you are planing on having an always on server:"
echo "Run screen -t jelly"
echo "Then at your home dir: sudo bash startserver.sh"
echo "Have Fun!"

