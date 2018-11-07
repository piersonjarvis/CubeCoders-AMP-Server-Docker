#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install unzip wget
sudo mkdir /home/minecraft
sudo chown $USER:$USER /home/minecraft
curl -fsSL get.docker.com | sh 
wait
sudo usermod -aG docker $USER
sudo apt-get install docker-compose -y
wget https://github.com/piersonjarvis/CubeCoders-AMP-Server-Docker/archive/master.zip
unzip master.zip
rm -r master.zip
mv CubeCoders-AMP-Server-Docker-master Server
echo "Enter AMP key"
read newkey
echo "Enter new AMP username"
read newuser
echo "Enter new AMP password"
read newpassword
cd Server
touch .env
echo "\$key=$newkey" >> .env
echo "\$username=$newuser" >> .env
echo "\$password=$newpassword" >> .env
sudo docker-compose up -d
