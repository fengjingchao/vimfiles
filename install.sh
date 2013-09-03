#!/bin/sh

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
[ -z $GOROOT ] && sed -i 's/"\(set rtp+=$GOROOT\/misc\/vim\)/\1/g' vimrc
