#!/bin/zsh
DOT_FILES=(.zshrc .zprofile .zshenv .vimrc .tmux.conf .pryrc .gemrc .railsrc .default-gems .rubocop.yml)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

mkdir -p $HOME/.config/nvim/lua
ln -s $HOME/dotfiles/init.lua $HOME/.config/nvim/init.lua
ln -s $HOME/dotfiles/nvim-plugins $HOME/.config/nvim/lua/plugins

mkdir -p $HOME/.config/git
ln -s $HOME/dotfiles/.gitconfig $HOME/.config/git/config
ln -s $HOME/dotfiles/.gitignore $HOME/.config/git/ignore
