#!/bin/bash
cd ~
python3 -m venv .defaultpyenv

echo "# default python virtualenvironment " >>~/.bashrc
echo "alias defaultpyenv='source ~/.defaultpyenv/bin/activate' " >>~/.bashrc

echo "activate by typing:  source .defaultpyenv/bin/activate"
echo "or reload shell and type defaultpyenv"
