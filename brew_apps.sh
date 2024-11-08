#!/bin/bash -exv

# sources:
# https://github.com/AlexTatiyants/dotfiles/blob/master/.brew
#

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade


# no more cask
#brew cask tap homebrew/cask-drivers
# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils
#? echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
# prev unrar, but it doesn't exist anymore
#brew install coreutils findutils bash dockutil gnupg2 keybase lzlib jsonlint imagemagick pgcli jq ffmpeg htop awscli@2 google-cloud-sdk
brew install coreutils findutils bash dockutil gnupg keybase lzlib jsonlint imagemagick pgcli jq ffmpeg htop awscli@2 google-cloud-sdk the_silver_searcher

# RIP the following:
# gpg-agent unrar
# homebrew/cask-drivers/brother-p-touch-editor

# sigsci chef
#brew install tfenv
#tfenv install 0.12.24
#tfenv use 0.12.24
#brew cask install chef/chef/chef-workstation terraform_landscape


# stanson toolchain
#brew install ansible gnu-tar

# standard toolchain
brew install git python3 mosh wget watch nmap bash-completion

# twic
brew install tfenv tflint terraform-docs

# python
#python3 -m ensurepip

# speaking of python, make sure we have a .pth for earlier lookup.
# https://github.com/Homebrew/legacy-homebrew/issues/27138
mkdir -p ~/Library/Python/2.7/lib/python/site-packages && echo "$(brew --prefix)/lib/python2.7/site-packages" > ~/Library/Python/2.7/lib/python/site-packages/homebrew.pth
mkdir -p ~/Library/Python/3.6/lib/python/site-packages && echo "$(brew --prefix)/lib/python3.6/site-packages" > ~/Library/Python/3.6/lib/python/site-packages/homebrew.pth
mkdir -p ~/Library/Python/3.7/lib/python/site-packages && echo "$(brew --prefix)/lib/python3.7/site-packages" > ~/Library/Python/3.7/lib/python/site-packages/homebrew.pth

# noncrashy term
brew install iterm2 vlc

# ruby
#brew install chruby ruby-install

# ruby versions
#ruby-install ruby 2.1.3

# node
brew install nvm

# beardedspice (audio controller that can pause apps from keyboard)
#brew install Caskroom/cask/beardedspice

# microsoft fonts (so spreadsheets/text editor quit complaining about Calibri)
brew tap colindean/fonts-nonfree && brew install font-microsoft-office

# chirp (ham)
# isntall personal only
#brew install tdsmith/ham/chirp

# misc
brew install rename
brew install dropbox slack zoom backblaze 1password

brew install postgresql
#/opt/homebrew/opt/postgresql/bin/postgres -D /opt/homebrew/var/postgres


# Remove outdated versions from the cellar
brew cleanup

