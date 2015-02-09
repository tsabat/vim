#! /bin/bash

set +e

sudo apt-get install -y git-core

cd /tmp
git clone git@github.com:tsabat/vim.git

cd vim
mv .vimrc ~

vim -c PluginInstall
