#!/bin/bash
apt-get update && apt-get upgrade  -y
wait
su AMP /home/AMP/AMP/ampinstmgr -a 
while true
do
if [[ $(su AMP bash /home/AMP/AMP/ampinstmgr -l) = *Running*yes* ]]
then
sleep 5m
fi
done