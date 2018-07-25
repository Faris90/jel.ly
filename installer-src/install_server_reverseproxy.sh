if [ "$EUID" -ne 0 ]
  then echo "je.ly Installer: Please run as root (sudo)"
  exit
fi


echo "jel.ly installer (with reverse proxy)"
read -p "Do you want to install nginx and a working config file? y/N" nginxacc

echo "Installing Dependencies & Upgrading System"
apt update && apt upgrade
apt install -y screen npm nodejs git

if ["$nginxacc"=="y"] || ["$nginxacc"=="Y"] ; then
apt install nginx
sudo systemctl start nginx
sudo systemctl enable nginx
rm /etc/nginx/conf.d/default.conf

wget https://aspriddell.github.io/jel.ly/installer-src/default.conf -P /etc/nginx/conf.d
nginx -s reload
fi

cd 
wget https://aspriddell.github.io/jel.ly/installer-src/startserver.sh
git clone https://github.com/aspriddell/jel.ly.git
cd jel.ly
npm install -g gulp
npm install

echo "Setup Complete. The modue screen has been installed. If you are planing on having an always on server:"
echo "Run screen -t jelly"
echo "Then at your home dir: sudo bash startserver.sh"
echo "Have Fun!"