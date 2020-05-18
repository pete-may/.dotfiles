#!/bin/bash 

echo "Installing zsh..."
sudo apt-get install zsh -y

echo "Installing tmux..."
sudo apt-get install tmux -y

echo "Installing vim..."
sudo apt-get install vim-nox -y

echo "Linking files..."
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/tmux/.tmux.conf $HOME/.tmux.conf

echo "Setting up vim..."
ln -s $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
mkdir -p $HOME/.vim
ln -s $HOME/.dotfiles/vim/.vim $HOME/.vim 

chsh -s /bin/zsh
