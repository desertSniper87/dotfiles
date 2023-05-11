#!/usr/bin/env bash

DEVICE=ubuntu-server

#stow --verbose --restow neovim
#stow --verbose --restow ranger
#stow --verbose --restow vsnip
#stow --verbose --restow qutebrowser
# stow --verbose -d devices/$DEVICE --target "$HOME" --restow bash
# stow --verbose -d devices/$DEVICE --target "$HOME" --restow vim
#stow --verbose -d devices/$DEVICE --target "$HOME" --restow alacritty
# stow --verbose --restow shell_scripts
stow --verbose --restow tmux
