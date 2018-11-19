#!/bin/bash
apt-get update && apt-get upgrade  -y
wait
unison -batch /home/AMP/.ampdata/.instances /config
cd /home/AMP/AMP
su AMP -c "./ampinstmgr -a"
while true
do
if [[ $(su AMP bash /home/AMP/AMP/ampinstmgr -l) = *Running*yes* ]]
then
sleep 5m
fi
done
