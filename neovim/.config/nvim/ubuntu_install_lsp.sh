#!/usr/bin/env bash

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

npm install -g pyright typescript-language-server svelte-language-server bash-language-server @angular/language-server @ansible/ansible-language-server
sudo apt install shellcheck

#cd "$(mktemp -d)" || return
#texlab_version=v4.2.2
#curl -OL https://github.com/latex-lsp/texlab/releases/download/$texlab_version/texlab-x86_64-linux.tar.gz
#tar -xf texlab-x86_64-linux.tar.gz
#sudo mv texlab /usr/bin/

sudo apt  install ccls
