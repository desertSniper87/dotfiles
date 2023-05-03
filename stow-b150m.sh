#!/usr/bin/env bash

DEVICE=b150m

stow --verbose --restow neovim
stow --verbose --restow ranger
stow --verbose --restow vsnip
stow --verbose -d devices/$DEVICE --target $HOME --restow bash
stow --verbose --restow shell_scripts
stow --verbose --restow git
stow --verbose -d devices/$DEVICE --target $HOME --restow sway
stow --verbose -d devices/$DEVICE --target "$HOME" --restow alacritty
stow --verbose --restow tmux
