#!/bin/bash

mkdir ~/.ssh/
ln -s ~/git/dotfiles/bashprofile ~/.profile
ln -s ~/git/dotfiles/sshconfig ~/.ssh/config

mkdir -p ~/.config/yamllint/
ln -s ~/git/dotfiles/yamllintconfig ~/.config/yamllint/config
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

mkdir -p ~/.vim/autoload/ ~/.vim/bundle/
if [ ! -e ~/.vim/autoload/pathogen.vim ]
  then curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi


sh brew
sh osx

sudo gem install jekyll s3_website compass bootstrap-sass
sudo -H pip3 install --upgrade --extra-index-url https://ops.stansonhealth.technology/python/simple/ PyStanson pycryptodome awscli yamllint git+git://github.com/ansible/ansible.git@devel#egg=ansible
sudo -H pip install boto boto3

## requires xcode / command line tools
#sudo pip install pyobjc
#python fix-macosx.py
