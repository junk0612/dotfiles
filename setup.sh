#!/bin/sh
DOT_FILES=(.zshrc .zprofile .zshenv .gitconfig .vimrc .tmux.conf .pryrc .gemrc .railsrc .default-gems .rubocop.yml .gitignore_global)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

mkdir -p $HOME/.vim/plugins

VIM_PLUGINS=(on_start.toml lazy.toml)

for file in ${VIM_PLUGINS[@]}
do
    ln -s $HOME/dotfiles/vim-plugins/$file $HOME/.vim/plugins/$file
done
