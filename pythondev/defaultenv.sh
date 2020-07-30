#!/bin/bash
cd ~
python3 -m venv .defaultpyenv
echo "alias venv='source ~/.defaultpyenv/bin/activate' " >>~/.bashrc

echo "activate by typing:  source .defaultpyenv/bin/activate"
echo "or reload shell and type defaultpyenv"
