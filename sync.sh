#!/bin/zsh

function pushconf () {
  if [ $# -ne 1 ]; then
    return 1
  fi

  original_dir=`pwd`
  cd ~/dotfiles
  git commit
  git push origin $1
  cd $original_dir
}

function diffconf () {
  original_dir=`pwd`
  cd ~/dotfiles
  git diff
  cd $original_dir
}

function addconf () {
  original_dir=`pwd`
  cd ~/dotfiles
  git add $*
  cd $original_dir
}

function statconf () {
  original_dir=`pwd`
  cd ~/dotfiles
  git status
  cd $original_dir
}
