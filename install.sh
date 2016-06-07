#!/bin/sh

mkdir -p ~/.vimtmp/swap
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +PluginInstall +qall

# install.py in YCM

# for vim-go, do ':GoInstallBinaries' if something is missing.
