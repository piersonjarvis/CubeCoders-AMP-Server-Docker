#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install unzip wget
sudo mkdir /home/minecraft
sudo chown $USER:$USER /home/minecraft
curl -fsSL get.docker.com | sh 
wait
sudo usermod -aG docker $USER
sudo apt-get install docker-compose
wget https://github.com/piersonjarvis/CubeCoders-AMP-Server-Docker/archive/master.zip
unzip master.zip
rm -r master.zip
mv CubeCoders-AMP-Server-Docker-master Server
read newkey
read newuser
read newpassword
echo "\$key=$newkey" >> ./Server/.env
echo "\$username=$newuser" >> ./Server/.env
echo "\$password=$newpassword" >> ./Server/.env
cd Server
sudo docker-compose up -d
