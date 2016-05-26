#!/bin/zsh

function pushconf () {
  if [ $# -ne 1 ]; then
    return 1
  fi

  pushd ~/dotfiles
  git commit
  git push origin $1
  popd
}

function diffconf () {
  pushd ~/dotfiles
  git diff
  popd
}

function addconf () {
  pushd ~/dotfiles
  git add $*
  popd
}

function statconf () {
  pushd ~/dotfiles
  git status
  popd
}
