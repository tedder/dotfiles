#!/bin/bash

mkdir ~/.ssh/
mkdir ~/.aws/
ln -s ~/git/dotfiles/bashprofile ~/.profile
ln -s ~/git/dotfiles/sshconfig ~/.ssh/config
ln -s ~/git/dotfiles/gitconfig ~/.gitconfig

mkdir -p ~/.vim/colors/
ln -s ~/git/dotfiles/vimrc ~/.vimrc
ln -s ~/git/dotfiles/wgetrc ~/.wgetrc
ln -s ~/git/dotfiles/vim/colors/solarized.vim ~/.vim/colors/

sh brew
sh osx

