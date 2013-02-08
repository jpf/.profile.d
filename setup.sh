#!/bin/sh

CWD=`pwd`

if [ "${CWD##*/}" != ".profile.d" ]; then
    echo "The name of this directory should be '.profile.d'"
    exit 1
fi
if [ -f ~/.bash_profile ]; then
    echo "You already have a .bash_profile. Backup that file and then run this script again"
    exit 1
fi

cd ~
set -x
ln -s $CWD/.bash_profile .
