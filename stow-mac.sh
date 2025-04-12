#!/usr/bin/env bash

DEVICE=mac

stow --verbose --restow neovim
stow --verbose -d devices/$DEVICE --target "$HOME" --restow bash
stow --verbose -d devices/$DEVICE --target "$HOME" --restow zsh
stow --verbose --restow ranger
stow --verbose -d devices/$DEVICE --target "$HOME" --restow zsh
stow --verbose -d devices/$DEVICE --target "$HOME" --restow alacritty
stow --verbose --restow tmux
stow --verbose --restow atuin
stow --verbose --restow zed
stow --verbose --restow ranger
stow --verbose --restow intellij
stow --verbose --restow python_scripts
stow --verbose --restow bash_aliases



