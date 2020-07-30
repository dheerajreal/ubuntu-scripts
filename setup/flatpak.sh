#!/bin/bash

sudo apt install flatpak gnome-software-plugin-flatpak -y

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
