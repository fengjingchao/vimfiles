#!/bin/sh

curdir=`pwd`

ln -s $curdir ~/.vim
ln -s $curdir/vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
