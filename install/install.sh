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

if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.bak
fi

if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi

ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/yabai/.yabairc ~/.yabairc
ln -s ~/.dotfiles/yabai/.skhdrc ~/.skhdrc

mkdir -p ~/.config/wezterm
mkdir -p ~/.config/nvim

ln -s ~/.dotfiles/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -s ~/.dotfiles/nvim/init.lua  ~/.config/nvim/init.lua

./install_brew.sh

brew install --cask 1password
brew install --cask alfred
brew install --cask wezterm
brew install --cask spotify
brew install --cask slack
brew install --cask firefox
brew install --cask obsidian
brew install --cask alt-tab
brew install --cask bettertouchtool
# brew install --cask anki
brew install --cask sublime-text

brew install fzf
brew install bat
brew install ripgrep
brew install fd
brew install python3
brew install neovim
brew install koekeishiya/formulae/yabai
brew install skhd
brew install jq

git submodule update --init
