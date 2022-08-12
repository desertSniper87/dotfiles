#!/usr/bin/env bash

PWD=$(pwd)
LATEST=$(ls ~/Downloads -tp | grep -v /$ | head -1)

mv ~/Downloads/"$LATEST" "$PWD"
