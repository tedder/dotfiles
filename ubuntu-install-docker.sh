#!/bin/bash -exv

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo -H apt update && sudo -H apt install -y docker-ce
sudo usermod -aG docker $USER
sudo systemctl enable docker

