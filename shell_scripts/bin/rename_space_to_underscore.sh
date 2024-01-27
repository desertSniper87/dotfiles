#!/bin/bash

rename_space_to_underscore () {
    local f="$1"
    mv "$f" "${f// /_}"
}


