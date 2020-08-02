#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# add alias
echo "  " >>~/.bashrc
echo "# apt updates  " >>~/.bashrc
echo 'alias updoot="sudo apt update && sudo apt upgrade" ' >>~/.bashrc
echo "  " >>~/.bashrc
echo "  type 'updoot' in terminal to update and upgrade "
source ~/.bashrc
