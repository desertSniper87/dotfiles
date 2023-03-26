#!/usr/bin/env bash

DEVICE=mac

stow --verbose --restow neovim
stow --verbose -d devices/$DEVICE --target "$HOME" --restow bash
stow --verbose -d devices/$DEVICE --target "$HOME" --restow zsh
stow --verbose --restow ranger
stow --verbose -d devices/$DEVICE --target "$HOME" --restow zsh
stow --verbose -d devices/$DEVICE --target "$HOME" --restow alacritty

