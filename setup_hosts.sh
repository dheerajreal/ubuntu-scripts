#!/bin/bash
cd /tmp
wget https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -O hosts

if [ -f /etc/hostsbkup ]; then
    echo "backup found , skip creating backup"
    sudo rm /etc/hosts
else
    echo "backup not found , create backup"
    sudo mv /etc/hosts /etc/hostsbkup
fi
echo "Installing hosts file"
sudo cp ./hosts /etc/hosts
echo "Installation complete"
