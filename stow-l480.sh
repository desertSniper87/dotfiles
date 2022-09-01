#!/usr/bin/env bash

stow --verbose --restow neovim
stow --verbose --restow ranger
stow --verbose -d devices/l480 --target $HOME --restow bash
