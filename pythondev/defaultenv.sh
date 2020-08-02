#!/bin/bash
cd ~
python3 -m venv .defaultpyenv

echo "  " >>~/.bashrc
echo "# default python virtualenvironment " >>~/.bashrc
echo "alias defaultpyenv='source ~/.defaultpyenv/bin/activate' " >>~/.bashrc
echo "  " >>~/.bashrc
echo "activate by typing:  defaultpyenv "
source ~/.bashrc
