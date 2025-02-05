#!/bin/zsh
DOT_FILES=(.zshrc .zprofile .zshenv .vimrc .tmux.conf .pryrc .gemrc .railsrc .default-gems .rubocop.yml)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

mkdir -p $HOME/.config
ln -s -t $HOME/.config/ $HOME/dotfiles/nvim
ln -s -t $HOME/.config/ $HOME/dotfiles/git
