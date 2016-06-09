#!/bin/zsh

function pushconf () {
  pushd ~/dotfiles
  git commit
  git push origin $*
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
  git status -sb
  popd
}
