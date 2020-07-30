#!/bin/bash
sudo apt install \
    baobab \
    synaptic \
    gdebi \
    gufw \
    nautilus-admin -y

#for preload
sudo apt install preload

#for tlp
sudo apt install tlp && sudo tlp start
