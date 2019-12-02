#!/bin/bash 

echo "Installing zsh..."
sudo apt-get install zsh -y

echo "Installing tmux..."
sudo apt-get install tmux -y

echo "Installing vim..."
sudo apt-get install vim-nox -y

echo "Linking files..."
ln -s $HOME/.dotfiles/raspi/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/raspi/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/.dotfiles/raspi/.zlogin $HOME/.zlogin

echo "Setting up vim..."
ln -s $HOME/.dotfiles/vim/.vimrc $HOME/.vimrc
mkdir $HOME/.vim
ln -s $HOME/.dotfiles/vim/colors $HOME/.vim/colors 
cd $HOME/.dotfiles/vim/bundle/YouCompleteMe
python3 install.py

chsh -s /bin/zsh
