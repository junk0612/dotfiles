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
# AGENTS.md holds the shared cross-agent rules, read natively by codex
ln -sfn $HOME/dotfiles/agents/AGENTS.md $HOME/.codex/AGENTS.md

mkdir -p $HOME/.claude
# CLAUDE.md imports AGENTS.md and adds Claude-Code-only notes; skills dir carries the shared skills
CLAUDE_FILES=(CLAUDE.md settings.json statusline-command.sh skills .mcp.json)
for file in ${CLAUDE_FILES[@]}
do
    ln -sfn $HOME/dotfiles/claude-config/$file $HOME/.claude/$file
done

# shared Agent Skills (open standard) are linked into codex too; codex keeps its own .system/ skills
mkdir -p $HOME/.codex/skills
for skill in $HOME/dotfiles/skills/*/; do
    ln -sfn "${skill%/}" "$HOME/.codex/skills/$(basename ${skill%/})"
done

# `asdf install ruby` compiles from source, and nvim builds native code too
# (telescope-fzf-native, tree-sitter parsers), so a fresh Linux box needs a toolchain.
# On mac these come from mac/Brewfile and the Command Line Tools instead.
if [ "$(uname)" = 'Linux' ]; then
    sudo apt update
    sudo apt install -y build-essential libssl-dev libyaml-dev zlib1g-dev \
        libffi-dev libreadline-dev libgdbm-dev
fi

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

# git-wt is a Go binary, but `go install` puts it under the asdf golang version dir
# (see `go env GOBIN`), so it would vanish on the next golang bump and break the
# `git wt --init zsh` line in .zshrc. Take the release binary instead.
# The mac release ships as a zip via Homebrew tap, so this is Linux-only.
GIT_WT_VERSION=v0.29.0
if [ "$(uname)" = 'Linux' ] && [ ! -x $HOME/.local/bin/git-wt ]; then
    case $(uname -m) in
        x86_64) arch=amd64 ;;
        arm64|aarch64) arch=arm64 ;;
    esac
    # the archive also holds README/LICENSE, so extract just the binary
    curl -fsSL https://github.com/k1LoW/git-wt/releases/download/$GIT_WT_VERSION/git-wt_${GIT_WT_VERSION}_linux_$arch.tar.gz \
        | tar -xz -C $HOME/.local/bin git-wt
fi
