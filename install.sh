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

ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/.vim ~/.vim

ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

# alacritty
mkdir -p ~/.config/alacritty
ln -s ~/.dotfiles/alacritty/alacritty.yml ~/.config/alacritty.yml
