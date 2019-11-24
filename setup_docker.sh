#!/bin/bash

sudo apt install docker.io
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
