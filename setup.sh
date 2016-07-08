#!/bin/sh
DOT_FILES=(.zshrc .zprofile .zshenv .gitconfig .vimrc .tmux.conf .pryrc .gemrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

ln -s $HOME/.default-gems $HOME/.rbenv/default-gems
