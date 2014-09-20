#!/bin/sh

mkdir -p ~/.vimtmp/swap
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +PluginInstall +qall

# install.sh in YCM

# for vim-go, do ':GoInstallBinaries' if something is missing.
