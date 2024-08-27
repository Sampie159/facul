#!/bin/bash

curl -O http://gnu.c3sl.ufpr.br/ftp/emacs/emacs-29.4.tar.gz
tar xf emacs-29.4.tar.gz
cd emacs-29.4/
mkdir build && cd build
../configure --with-gnutls=ifavailable --with-gif=ifavailable
make -j6
ln -sf ~/facul/emacs ~/.config/
rm -rf ~/.emacs.d/
