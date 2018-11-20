FROM ubuntu

EXPOSE 8080 19132 25565 27015 7777 7778 27020

COPY AMP-check.sh .

RUN apt-get update && apt-get upgrade -y && \
apt-get install lib32gcc1 lib32stdc++6 coreutils screen tmux socat unzip git wget libsqlite3-dev openjdk-8-jre-headless -y && \
useradd -d /home/AMP -m AMP && echo AMP:AMP | chpasswd && \
mkdir /config 

VOLUME /config

RUN mkdir /home/AMP/AMP && cd /home/AMP/AMP

WORKDIR /home/AMP/AMP

RUN wget http://cubecoders.com/Downloads/ampinstmgr.zip  && \
unzip ampinstmgr.zip && rm -i ampinstmgr.zip && \
su AMP -c "./ampinstmgr -quick admin password 0.0.0.0 8080"

CMD [ "/bin/bash","/AMP-check.sh" ]