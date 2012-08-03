CWD=`pwd`

if [ "${CWD##*/}" != ".profile.d" ]; then
    echo "The name of this directory should be '.profile.d'"
    exit
fi
if [ -f ~/.bash_profile ]; then
    echo "You already have a .bash_profile. Backup that file and then run this script again"
    exit
fi

cd ~
ln -s $CWD/.bash_profile .
