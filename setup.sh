#!/bin/zsh
DOT_FILES=(.zshrc .zprofile .zshenv .gitconfig .vimrc .tmux.conf .pryrc .gemrc .railsrc .default-gems .rubocop.yml .gitignore_global)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

mkdir -p $HOME/.config/nvim/lua
ln -s $HOME/dotfiles/init.lua $HOME/.config/nvim/init.lua
ln -s $HOME/dotfiles/nvim-plugins $HOME/.config/nvim/lua/plugins
