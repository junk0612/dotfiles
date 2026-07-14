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
# codex writes trust levels and NUX state into config.toml, so seed-copy it instead of linking
[ -f $HOME/.codex/config.toml ] || cp $HOME/dotfiles/.codex/config.toml $HOME/.codex/config.toml
ln -sfn $HOME/dotfiles/.codex/AGENTS.md $HOME/.codex/AGENTS.md

mkdir -p $HOME/.claude
CLAUDE_FILES=(settings.json statusline-command.sh skills .mcp.json)
for file in ${CLAUDE_FILES[@]}
do
    ln -sfn $HOME/dotfiles/claude-config/$file $HOME/.claude/$file
done

# asdf is a single Go binary since 0.16, so the same install works on mac and Linux
ASDF_VERSION=v0.16.4
if [ ! -x $HOME/.local/bin/asdf ]; then
    os=$(uname | tr '[:upper:]' '[:lower:]')
    case $(uname -m) in
        x86_64) arch=amd64 ;;
        arm64|aarch64) arch=arm64 ;;
    esac
    mkdir -p $HOME/.local/bin
    curl -fsSL https://github.com/asdf-vm/asdf/releases/download/$ASDF_VERSION/asdf-$ASDF_VERSION-$os-$arch.tar.gz | tar -xz -C $HOME/.local/bin
fi

mkdir -p ${ASDF_DATA_DIR:-$HOME/.asdf}/completions
$HOME/.local/bin/asdf completion zsh > ${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf

for plugin in $(awk '{print $1}' $HOME/dotfiles/.tool-versions); do
    $HOME/.local/bin/asdf plugin add $plugin 2>/dev/null || true
done
