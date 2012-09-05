#!/bin/bash
cd ~
git clone http://github.com/eschulte/emacs-starter-kit.git
mv emacs-starter-kit/ .emacs.d
cd ~/.emacs.d/
git submodule init
git submodule update
cd src/org/
make
cd ../..
cd src/auctex
./configure && make