#!/bin/zsh
DOT_FILES=(.zshrc .zprofile .zshenv .tmux.conf .gemrc .railsrc .default-gems .rubocop.yml .codex)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

mkdir -p $HOME/.config
ln -s -t $HOME/.config/ $HOME/dotfiles/nvim
ln -s -t $HOME/.config/ $HOME/dotfiles/git

mkdir -p $HOME/.codex
ln -s $HOME/dotfiles/codex/config.toml $HOME/.codex/config.toml
