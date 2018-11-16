#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install unzip wget dialog -y
curl -fsSL get.docker.com | sh 
wait
sudo usermod -aG docker "$USER"
sudo apt-get install docker-compose -y
newdir=$(dialog --stdout --title "Config Directory" --inputbox "Please enter mount point for managing config files:" 0 0)
sudo mkdir $newdir
sudo chown "$USER":"$USER" $newdir
sed -e s/\/home\/minecraft/$newdir/g -i Dockerfile
wget https://github.com/piersonjarvis/CubeCoders-AMP-Server-Docker/archive/master.zip
unzip master.zip
rm -r master.zip
mv CubeCoders-AMP-Server-Docker-master Server
cd Server
newkey=$(dialog --stdout --title "amp key" --inputbox "Please enter amp server key:" 0 0)
#read -pr "Enter AMP key:" newkey;
newuser=$(dialog --stdout --title "Username" --inputbox "Please enter new username:" 0 0)
#read -pr "Enter new AMP username:" newuser;
password=$(dialog --stdout --title "Password" --PasswordBox "Please enter new password:" 0 0)
#read -pr "Enter new AMP password:" newpassword;
touch .env
{ echo "\$key=$newkey"; echo "\$password=$newpassword"; echo "\$username=$newuser"; } >> .env
sudo docker build -q -t amp-server .
sudo docker-compose up -d
