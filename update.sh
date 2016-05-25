#!/bin/zsh

if [ $# -ne 1 ]; then
  return 1
fi

cd ~/dotfiles
git commit
git push origin $1
cd -

