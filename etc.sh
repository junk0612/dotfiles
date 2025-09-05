#!/bin/zsh

function mkcd () {
  mkdir $1 && cd $_
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

function memop () {
  mkdir -p ~/Documents/memo
  today=`date "+%Y%m%d"`
  vim "$HOME/Documents/memo/${today}.md"
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
