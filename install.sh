#!/bin/sh

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
sh $GOPATH/src/github.com/nsf/gocode/vim/update.sh
