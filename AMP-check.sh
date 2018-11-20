#!/bin/bash
apt-get update && apt-get upgrade  -y
wait
if [ ! -f /config/.instances ];
then
cp /home/AMP/.ampdata/* /config/.
fi
wait
ln -f /config/* /home/AMP/.ampdata/.
cd /home/AMP/AMP
su AMP -c "./ampinstmgr -a"
while true
do
if [[ $(su AMP bash /home/AMP/AMP/ampinstmgr -l) = *Running*yes* ]]
then
sleep 5m
fi
done
