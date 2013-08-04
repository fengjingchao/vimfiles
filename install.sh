#!/bin/sh

curdir=`pwd`

rm ~/.vim
ln -s $curdir ~/.vim
rm ~/.vimrc
ln -s $curdir/vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
sh ./bundle/YouCompleteMe/install.sh
