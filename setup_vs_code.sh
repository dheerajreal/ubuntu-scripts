#!/bin/bash
cd /tmp
wget  "https://go.microsoft.com/fwlink/?LinkID=760868" -O vscode.deb
sudo apt install ./vscode.deb
#rm -f vscode.deb
