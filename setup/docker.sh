#!/bin/bash

sudo apt install docker.io docker-compose -y
# sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
echo "done"
