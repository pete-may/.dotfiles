#!/bin/bash

if [ -f ~/.bash_profile ]; then
    mv ~/.bash_profile ~/.bash_profile.bak
fi
if [ -f ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.bak
fi
if [ -f ~/.inputrc ]; then
    mv ~/.inputrc ~/.inputrc.bak
fi
if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi

ln -s ~/.dotfiles/run/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/run/.inputrc ~/.inputrc
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc

source ~/.bash_profile
