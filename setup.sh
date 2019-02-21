#!/bin/bash -exv

# aws
mkdir -p ~/.aws/
[[ -f ~/.aws/config ]] || ln -s ~/Dropbox/ted-geek/aws-config ~/.aws/config

#vim
mkdir -p ~/.vim/colors/
[[ -f ~/.vimrc ]] || ln -s ~/git/dotfiles/vimrc ~/.vimrc

# ssh
mkdir -p ~/.ssh/
#ln -s ~/git/dotfiles/bashprofile ~/.profile
[[ -f ~/.ssh/config ]] || ln -s ~/git/dotfiles/sshconfig ~/.ssh/config

chmod 600 ~/.ssh/config

cp ~/Dropbox/ted-geek/ssh/mythtv/id* ~/.ssh/
chmod 600 ~/.ssh/id*
#cp ~/Dropbox/ted-geek/ssh/stanson/ted_stanson_id_rs* ~/.ssh/
#chmod 600 ~/.ssh/ted_stanson_id*


# git
[[ -f ~/.gitconfig ]] || ln -s ~/git/dotfiles/gitconfig ~/.gitconfig

# misc
mkdir -p ~/.config/yamllint/
[[ -f ~/.config/yamllint/config ]] || ln -s ~/git/dotfiles/yamllintconfig ~/.config/yamllint/config
[[ -f ~/.bc ]] || ln -s ~/git/dotfiles/bcrc ~/.bc
[[ -f ~/.wgetrc ]] || ln -s ~/git/dotfiles/wgetrc ~/.wgetrc





if [[ "$OSTYPE" == "darwin"* ]]; then
  sh brew
  sh osx
fi

OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
#echo $OS
if [[ $OS == *"Ubuntu"* ]]; then
  sudo -H apt update
  sudo -H apt install -y vim python3-pip curl git apt-transport-https ca-certificates software-properties-common vlc mesa-utils whois ssh-server net-tools nmap

  sudo -H apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
  sudo -H apt-add-repository "deb https://deb.etcher.io stable etcher"
  sudo -H apt update
  sudo -H apt install -y balena-etcher-electron mosquitto-clients youtube-dl ffmpeg barrier gthumb

  echo 1 > /sys/module/hid_apple/parameters/fnmode
  sudo snap install slack --classic
  sudo snap install openscad-nightly
  sudo snap install jq
  bash ubuntu-install-docker.sh
  # sudo add-apt-repository ppa:ubuntu-x-swat/updates
  update-alternatives --set editor /usr/bin/vim.basic
fi


#sudo gem install jekyll s3_website compass bootstrap-sass
#sudo -H pip3 install --upgrade --extra-index-url https://ops.stansonhealth.technology/python/simple/ PyStanson pycryptodome awscli yamllint git+git://github.com/ansible/ansible.git@devel#egg=ansible
sudo -H pip3 install boto boto3 youtube-dl awscli yamllint

## requires xcode / command line tools
#sudo pip install pyobjc
#python fix-macosx.py

# requires package installs- eg curl

mkdir -p ~/.vim/autoload/ ~/.vim/bundle/
[[ -f ~/.vim/colors/solarized.vim ]] || ln -s ~/git/dotfiles/vim/colors/solarized.vim ~/.vim/colors/
if [ ! -e ~/.vim/autoload/pathogen.vim ]
  then curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi
