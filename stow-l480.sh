#!/usr/bin/env bash

DEVICE=l480

stow --verbose --restow neovim
stow --verbose --restow ranger
stow --verbose --restow vsnip
stow --verbose --restow qutebrowser
stow --verbose -d devices/$DEVICE --target "$HOME" --restow bash
stow --verbose -d devices/$DEVICE --target "$HOME" --restow alacritty
stow --verbose --restow shell_scripts
stow --verbose --restow i3
stow --verbose --restow Xdefaults
stow --verbose --restow rxvt_perls
stow --verbose --restow git
stow --verbose -d devices/$DEVICE --target "$HOME" --restow sway
stow --verbose --restow tmux
