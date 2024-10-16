#!/bin/bash

git clone --depth=1 -b release-0.10 --single-branch https://github.com/neovim/neovim.git 
cd neovim
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=~/
make install
ln -sf ~/facul/nvim ~/.config
