#!/bin/zsh
DOT_FILES=(.zshrc .zprofile .gitconfig)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

