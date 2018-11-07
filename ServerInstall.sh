#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install unzip wget -y
sudo mkdir /home/minecraft
sudo chown ""$USER:$USER"" /home/minecraft
curl -fsSL get.docker.com | sh 
wait
sudo usermod -aG docker ""$USER""
sudo apt-get install docker-compose -y
wget https://github.com/piersonjarvis/CubeCoders-AMP-Server-Docker/archive/master.zip
unzip master.zip
rm -r master.zip
mv CubeCoders-AMP-Server-Docker-master Server
cd Server
read -p "Enter AMP key:" newkey
read -p "Enter new AMP username:" newuser
read -p "Enter new AMP password:" newpassword
touch .env
echo "\$key=$newkey" >> .env
echo "\$username=$newuser" >> .env
echo "\$password=$newpassword" >> .env
sudo docker build -q -t amp-server .
sudo docker-compose up -d
