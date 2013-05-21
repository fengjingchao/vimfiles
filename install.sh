#!/bin/sh

ln -s `pwd` ~/.vim
ln -s vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
