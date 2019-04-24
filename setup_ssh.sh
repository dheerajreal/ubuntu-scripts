#!/bin/bash

#Print public SSH key to console.
#Generate it if doesn't exist.

file="$HOME/.ssh/id_rsa.pub"
if [ ! -f "$file" ]; then
  ssh-keygen -t rsa -b 4096
fi

cat "$file"
