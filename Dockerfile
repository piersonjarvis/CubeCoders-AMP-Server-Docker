FROM ubuntu

EXPOSE 8080 19132 25565 27015 7777 7778 27020

RUN apt-get update && apt-get upgrade -y && \
apt-get install lib32gcc1 lib32stdc++6 coreutils screen tmux socat unzip git wget libsqlite3-dev default-jre -y && \
useradd -d /home/AMP -m AMP && echo AMP:AMP | chpasswd

RUN mkdir /home/AMP/AMP && cd /home/AMP/AMP

WORKDIR /home/AMP/AMP

RUN wget http://cubecoders.com/Downloads/ampinstmgr.zip  && \
unzip ampinstmgr.zip && rm -i ampinstmgr.zip && \
su AMP -c ./ampinstmgr -quick $username $password 0.0.0.0 8080
CMD [ "/bin/bash","/AMP-check.sh" ]
