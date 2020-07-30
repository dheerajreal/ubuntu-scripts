#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# add alias
echo 'alias updoot="sudo apt update && sudo apt upgrade" ' >>~/.bashrc
echo " in future type updoot in terminal to update and upgrade "
