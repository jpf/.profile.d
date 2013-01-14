#!/bin/sh

CWD=`pwd`

if [ "${CWD##*/}" != ".profile.d" ]; then
    echo "The name of this directory should be '.profile.d'"
    exit 1
fi

cd ~
set -x

if [ -f ~/.bash_profile ]; then
    echo "You already have a .bash_profile. Backup that file and then run this script again"
else
    ln -s $CWD/.bash_profile .
    echo "Installed .bash_profile"
fi

if [ -f ~/.zshrc ]; then
    echo "You already have a .zshrc. Backup that file and then run this script again"
else
    ln -s $CWD/.zshrc .
    ln -s $CWD/.oh-my-zsh .
    echo "Installed .zshrc"
fi
