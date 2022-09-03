#!/usr/bin/env bash

stow --verbose --restow neovim
stow --verbose --restow ranger
stow --verbose --restow vsnip
stow --verbose -d devices/b150m --target $HOME --restow bash
