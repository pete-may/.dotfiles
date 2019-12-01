#!/bin/bash 

sudo apt-get install zsh -y
sudo apt-get install tmux -y
sudo apt-get install vim -y
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/run/.raspi_bash_profile $HOME/.bash_profile
chsh -s /bin/zsh
source $HOME/.bash_profile
