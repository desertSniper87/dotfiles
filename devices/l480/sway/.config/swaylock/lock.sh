#!/usr/bin/env bash


swaylock \
  --indicator-radius 160 \
  --indicator-thickness 20 \
  --line-uses-ring \
  --clock \
  --font 'NotoSans Nerd Font Mono:style=Thin,Regular 40' \
  --screenshot \
  --grace 10 \
  --fade-in 10 \
  --effect-blur 10x10 \
  --effect-compose "36.7%x29.6%;center;$HOME/dotfiles/logos/bcc_logo.png" \
  --daemonize
