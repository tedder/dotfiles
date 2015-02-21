#!/bin/bash

mkdir ~/.ssh/
ln -s ~/git/dotfiles/bashprofile ~/.profile
ln -s ~/git/dotfiles/sshconfig ~/.ssh/config
chmod 600 ~/.ssh/config
ln -s ~/git/dotfiles/gitconfig ~/.gitconfig

cp ~/Dropbox/ted-geek/ssh/mythtv/id* ~/.ssh/
chmod 600 ~/.ssh/id*
cp ~/Dropbox/ted-geek/ssh/stanson/ted_stanson_id_rs* ~/.ssh/
chmod 600 ~/.ssh/ted_stanson_id*

mkdir ~/.aws/
ln -s ~/Dropbox/ted-geek/aws-config ~/.aws/config

mkdir -p ~/.vim/colors/
ln -s ~/git/dotfiles/vimrc ~/.vimrc
ln -s ~/git/dotfiles/wgetrc ~/.wgetrc
ln -s ~/git/dotfiles/vim/colors/solarized.vim ~/.vim/colors/

sh brew
sh osx

sudo gem install jekyll s3_website compass bootstrap-sass


## requires xcode / command line tools
#sudo pip install pyobjc
#python fix-macosx.py
