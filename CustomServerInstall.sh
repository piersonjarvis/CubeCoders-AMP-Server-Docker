#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install unzip wget -y
curl -fsSL get.docker.com | sh 
wait
sudo usermod -aG docker "$USER"
sudo apt-get install docker-compose -y
sudo mkdir /home/minecraft
sudo chown "$USER":"$USER" /home/minecraft
wget https://github.com/piersonjarvis/CubeCoders-AMP-Server-Docker/archive/master.zip
unzip master.zip
rm -r master.zip
mv CubeCoders-AMP-Server-Docker-master Server
cd Server
read -pr "Enter AMP key:" newkey;
read -pr "Enter new AMP username:" newuser;
read -pr "Enter new AMP password:" newpassword;
touch .env
{ echo "\$key=$newkey"; echo "\$password=$newpassword"; echo "\$username=$newuser"; } >> .env
sudo docker build -q -t amp-server .
sudo docker-compose up -d
