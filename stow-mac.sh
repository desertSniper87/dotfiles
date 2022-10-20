#!/usr/bin/env bash

DEVICE=mac

stow --verbose --restow neovim
stow --verbose -d devices/$DEVICE --target "$HOME" --restow bash
