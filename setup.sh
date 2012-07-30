if [ -f ~/.bash_profile ]; then
    echo "You already have a .bash_profile. Backup that file and then run this script again"
    exit
fi
CWD=`pwd`
cd ~
ln -s $CWD/.bash_profile .
