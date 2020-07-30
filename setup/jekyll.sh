#!/bin/bash

#for more details go to
#https://jekyllrb.com/docs/installation/ubuntu/

#Before we install Jekyll, we need to make sure we have all the required dependencies.

sudo apt install ruby-full build-essential zlib1g-dev -y

#It is best to avoid installing Ruby Gems as the root user.
#Therefore, we need to set up a gem installation directory for your user account.

echo '# Install Ruby Gems to ~/.gemstore' >>~/.bashrc
echo 'export GEM_HOME="$HOME/.gemstore"' >>~/.bashrc
echo 'export PATH="$HOME/.gemstore/bin:$PATH"' >>~/.bashrc
source ~/.bashrc

#Finally, install Jekyll

#gem install jekyll bundler
echo "gem install jekyll bundler" | bash
#That’s it! You’re ready to start using Jekyll.

echo "done"
