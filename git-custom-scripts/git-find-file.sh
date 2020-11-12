#!/usr/bin/env bash

#for branch in $(git rev-list --all)
for branch in $(git branch | cut -c 3-)
do
  if (git ls-tree -r --name-only $branch | grep --quiet "$1")
  then
     echo $branch
  fi
done

