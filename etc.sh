#!/bin/zsh

function mkcd () {
  mkdir $1 && cd $_
}

function vconf () {
  if [ $# -eq 0 ]; then
    nvim ~/.config/nvim/init.lua
  elif [ "$1" = "ls" ]; then
    ls ~/.config/nvim/lua/config/*.lua 2>/dev/null | xargs -n1 basename | sed 's/\.lua$//'
  else
    nvim ~/.config/nvim/lua/config/$1.lua
  fi
}


function update () {
  pushd ~/dotfiles
  git pull origin master
  popd
  pushd ~/.enhancd
  git pull origin master
  popd
  source ~/.zshrc
  brew update
  brew upgrade
  brew cask upgrade
  brew cleanup
  asdf plugin-update --all
}


function gcd() {
  if [ $# -eq 1 ]; then
    repo=$(ghq list -p | fzf -q $1)
  else
    repo=$(ghq list -p | fzf)
  fi

  if [ -n "$repo" ]; then
    cd $repo
  fi
}
