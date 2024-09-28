#!/bin/bash

git clone --depth=1 https://github.com/neovim/neovim.git 
cd neovim
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX = ~/
make install
ln -sf ~/facul/nvim ~/.config
