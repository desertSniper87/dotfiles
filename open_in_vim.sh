#!/usr/bin/env bash

gnome-terminal.real -x sh -c "vim --servername 'eclipse' --remote $@"
