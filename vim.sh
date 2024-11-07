#!/bin/bash

git clone --depth=1 -b v0.10.2 --single-branch https://github.com/neovim/neovim.git 
cd neovim
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=~/
make install
ln -sf ~/facul/nvim ~/.config
ln -sf ~/facul/tmux ~/.config
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
