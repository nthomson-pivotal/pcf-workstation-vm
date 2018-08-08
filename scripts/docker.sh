#!/bin/bash

set -e

DOCKER_COMPOSE_VERSION=1.22.0

# Install Docker
sudo apt-get remove docker docker-engine docker.io

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt update

sudo apt install -y docker-ce

sudo usermod -aG docker $JUMPBOX_USERNAME

# Install Docker Compose
wget -q https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-Linux-x86_64 && \
  sudo mv docker-compose-Linux-x86_64 /usr/local/bin/docker-compose && \
  sudo chmod +x /usr/local/bin/docker-compose

# Install Docker Registry
#sudo docker run -d \
#  -p 5000:5000 \
#  --restart=always \
#  --name registry \
#  registry:2.6

#sudo docker pull datianshi/spring-music

#sudo docker tag datianshi/spring-music localhost:5000/spring-music

#sudo docker push localhost:5000/spring-music
