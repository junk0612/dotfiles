#!/bin/zsh
DOT_FILES=(.zshrc .zshenv .tmux.conf .gemrc .railsrc .default-gems .rubocop.yml .tool-versions)

for file in ${DOT_FILES[@]}
do
    ln -sfn $HOME/dotfiles/$file $HOME/$file
done

mkdir -p $HOME/.config
ln -sfn $HOME/dotfiles/nvim $HOME/.config/nvim
ln -sfn $HOME/dotfiles/git $HOME/.config/git

# ~/.codex and ~/.claude hold runtime state (auth, sessions, caches),
# so link config files individually instead of symlinking the whole directory
mkdir -p $HOME/.codex
ln -sfn $HOME/dotfiles/.codex/config.toml $HOME/.codex/config.toml
ln -sfn $HOME/dotfiles/.codex/AGENTS.md $HOME/.codex/AGENTS.md

mkdir -p $HOME/.claude
CLAUDE_FILES=(settings.json statusline-command.sh skills .mcp.json)
for file in ${CLAUDE_FILES[@]}
do
    ln -sfn $HOME/dotfiles/claude-config/$file $HOME/.claude/$file
done
