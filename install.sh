#!/bin/sh

# Choose the option you want
# 1. neocomplete
# 2. youcompleteme
#
# Then
# cp vim.bundle[#] vim.bundle
# cp vimrc[#] vimrc

mkdir -p ~/.vimtmp/swap
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
sh $GOPATH/src/github.com/nsf/gocode/vim/update.sh

# go get -u code.google.com/p/go.tools/cmd/goimports
# go get -u github.com/nsf/gocode
#
# rm after/ if using ycm
