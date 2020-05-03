#!/bin/sh

cd ~
# sudo apt install i3 i3lock i3blocks qutebrowser
echo yes | sudo apt install git ctags
echo yes | sudo apt install nodejs clang npm 
echo yes | sudo apt install lm_sensors redshift variety
echo yes | sudo apt install emacs copyq # hg
echo yes | sudo apt install ack texstudio texlive-full htop aspell python3-pip nmap mysql-workbench mysql-server cmake apg python3-dev 

curl -L git.io/antigen > antigen.zsh
echo yes | sudo apt install zsh-theme-powerlevel9k zsh-autosuggestions zsh-history-substring-search autojump thefuck

 # Install chrome

#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
#sudo apt-get update 
#echo yes | sudo apt-get install google-chrome-stable


# mkdir ~/.fonts
# git clone https://github.com/sunaku/tamzen-font

# cd ~
# curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# sudo python get-pip.py

# sudo apt install exuberant-ctags

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Powerline fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
