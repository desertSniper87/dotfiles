#!/usr/bin/env bash

echo yes | sudo apt-get update && sudo apt-get upgrade

# Access virtualbox shared folder
sudo usermod -aG vboxsf torsho

# Install chromium
echo yes | sudo apt-get install chromium-browser

# Install chrome

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update 
echo yes | sudo apt-get install google-chrome-stable

# Install brave

sudo apt-get install curl

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

#$release_name="$(lsb_release -sc)"
echo 'deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com xenial main' | sudo tee /etc/apt/sources.list.d/brave.list

sudo apt-get update
echo yes | sudo apt-get install brave-browser brave-keyring
