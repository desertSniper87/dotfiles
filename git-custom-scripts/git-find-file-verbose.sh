#!/usr/bin/env bash

#for branch in $(git rev-list --all)
for branch in $(git branch | cut -c 3-)
do
  git ls-tree -r --name-only $branch | grep "$1" | sed 's/^/'$branch': /'
done

