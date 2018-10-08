#!/bin/sh

cd ~
sudo apt install git vim
sudo apt install i3 i3lock i3blocks qutebrowser
sudo apt install nodejs clang npm 
sudo apt install lm_sensors redshift variety


mkdir ~/.fonts
git clone https://github.com/sunaku/tamzen-font

cd ~
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py

sudo apt install exuberant-ctags
