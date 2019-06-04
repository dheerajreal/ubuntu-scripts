#!/bin/bash
#some hidpi displays have scaling issues with qt apps like vlc and qbittorrent
#this script will fix that
#a reboot might be needed


sudo sed -i -e '1iexport QT_AUTO_SCREEN_SCALE_FACTOR=0\' /etc/environment
