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

if [ -f ~/.zshrc]; then
    mv ~/.zshrc ~/.zshrc.bak
fi

if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi

ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/.vim ~/.vim

ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

# kitty
mkdir -p ~/.config/kitty
ln -s ~/.dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

brew install fzf
brew install bat
brew install ripgrep
brew install fd
brew install python3

