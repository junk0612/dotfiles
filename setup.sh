#!/bin/sh
DOT_FILES=(.zshrc .zprofile .zshenv .gitconfig .vimrc .tmux.conf .pryrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

