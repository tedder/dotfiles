#!/bin/bash -exv

DOTDIR=`pwd`
# rm -rf ~/.vim ~/.vimrc ~/.wgetrc ~/.aws/config ~/.gitconfig ~/.config/yamllint/config ~/.ssh/config ~/.profile

# aws
mkdir -p ~/.aws/
[[ -f ~/.aws/config ]] || ln -s ~/Dropbox/ted-geek/aws-config ~/.aws/config
[[ -f ~/.aws/credentials ]] || ln -s ~/Dropbox/ted-geek/aws-credentials ~/.aws/credentials

#vim
mkdir -p ~/.vim/colors/
[[ -f ~/.vimrc ]] || ln -s $DOTDIR/vimrc ~/.vimrc

# ssh
mkdir -p ~/.ssh/
[[ -f ~/.ssh/config ]] || ln -s $DOTDIR/sshconfig ~/.ssh/config
chmod 600 ~/.ssh/config

cp ~/Dropbox/ted-geek/ssh/mythtv/id* ~/.ssh/
chmod 600 ~/.ssh/id*

#bash
[[ -f ~/.profile ]] || ln -s $DOTDIR/bashprofile ~/.profile


# git
[[ -f ~/.gitconfig ]] || ln -s $DOTDIR/gitconfig ~/.gitconfig

# misc
mkdir -p ~/.config/yamllint/
[[ -f ~/.config/yamllint/config ]] || ln -s $DOTDIR/yamllintconfig ~/.config/yamllint/config

[[ -f ~/.bc ]] || ln -s $DOTDIR/bcrc ~/.bc
[[ -f ~/.wgetrc ]] || ln -s $DOTDIR/wgetrc ~/.wgetrc
[[ -f ~/.pypirc ]] || ln -s $DOTDIR/pypirc ~/.pypirc

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
  sudo -H apt install -y balena-etcher-electron mosquitto-clients youtube-dl ffmpeg barrier gthumb exfat-utils rename arduino


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

[[ -f /usr/local/etc/bash_completion.d/aws_bash_completer.bash-completion ]] || sudo ln -s /usr/local/bin/aws_bash_completer /usr/local/etc/bash_completion.d/aws_bash_completer.bash-completion

## requires xcode / command line tools
#sudo pip install pyobjc
#python fix-macosx.py

# requires package installs- eg curl

mkdir -p ~/.vim/autoload/ ~/.vim/bundle/
[[ -f ~/.vim/colors/solarized.vim ]] || ln -s $DOTDIR/vim/colors/solarized.vim ~/.vim/colors/
if [ ! -e ~/.vim/autoload/pathogen.vim ]
  then curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi
