# PATH
if [ "$(uname)" = 'Darwin' ]; then
  export PATH=$(brew --prefix)/bin:$PATH
fi

# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats ' (%s:%b)'
precmd (){
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[1]=$vcs_info_msg_0_
}
PROMPT='%F{cyan}%B%n%b%f at %F{green}%~%f%F{magenta}%1v%f> '
RPROMPT=''

# ls colors
if [ "$(uname)" = 'Darwin' ]; then
  export LSCOLORS=cxfxcxdxbxegedabagacad
  alias l='ls -alGF'
else
  eval "$(dircolors -b)"
  alias l='ls -alF --color=auto'
fi

# completion
fpath=(${ASDF_DIR}/completions $fpath)
if [ "$(uname)" = 'Darwin' ] && type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
autoload -Uz compinit
compinit
setopt correct
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# directory stack
setopt pushd_ignore_dups

# Use Japanese
export LANG=ja_JP.UTF-8

# bind keys like emacs
bindkey -e

# Aliases
## git
alias g=git
alias ga='git add'
alias gaa='git add -A'
alias gap='git add -p'
alias gb='git branch'
alias gbD='git branch -D'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbm='git branch -m'
alias gc='git commit'
alias gca='git commit --amend'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gcn='git commit --amend --no-edit'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='git fetch'
alias gg='git grep'
alias gl='git pull'
alias glo='git pull origin'
alias glom='git pull-base-from-origin'
alias glg='git log --stat'
alias glgp='git log -p'
alias gm='git merge'
alias gp='git push'
alias gpo='git push origin'
alias gpof='git push origin --force-with-lease'
alias gpom='git push-base-to-origin'
alias grb='git rebase'
alias gre='git restore'
alias gri='git rebase -i'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'
alias grhh='git reset --hard HEAD'
alias grm='git remote'
alias grs='git reset'
alias grsh='git reset --hard'
alias grss='git reset --soft'
alias gst='git status -sb'
alias gsta='git stash'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstlp='git stash list -p'
alias gstp='git stash pop'
alias gsw='git switch'
alias gsc='git switch -c'
alias gsd='git switch -d'
alias co='git checkout `git branch | fzf | sed -e "s/\* //g" | awk "{print \$1}"`'

## rails
alias bi='bundle install'
alias be='bundle exec'
alias bu='bundle update'
alias bo='bundle open'

## others
alias diff='diff -u'
alias reload='source ~/.zshrc'
alias zconf='vi ~/dotfiles/.zshrc'
alias zenvconf='vi ~/dotfiles/.zshenv'
alias gconf='vi ~/dotfiles/git/config'
alias tconf='vi ~/dotfiles/.tmux.conf'
alias copconf='vi ~/dotfiles/.rubocop.yml'
alias gignore='vi ~/dotfiles/git/ignore'
alias c='cd'
alias v='nvim'
alias vi='nvim'
alias t='tmux'
alias adconf='addconf'
alias dfconf='diffconf'
alias psconf='pushconf'
alias stconf='statconf'
alias cop='rubocop --format fuubar --display-cop-names'
alias f='fillin'
alias d='docker'
alias dc='docker compose'
alias ai='ollama'
alias cl='claude'

source ~/dotfiles/sync.sh
source ~/dotfiles/etc.sh

# default editor
export EDITOR=nvim

# for fzf
export FZF_DEFAULT_OPTS="--extended --select-1 --exit-0 --reverse --ansi"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ "$(uname)" = 'Darwin' ]; then
  source <(fzf --zsh)
elif [ "$(uname)" = 'Linux' ]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

if [ "$(uname)" = 'Darwin' ]; then
  . $(brew --prefix asdf)/libexec/asdf.sh
elif [ "$(uname)" = 'Linux' ]; then
  . $HOME/.asdf/asdf.sh
fi

export PATH="$PATH:$HOME/.deno/bin"

# for git/diff-highlight
if [ "$(uname)" = 'Darwin' ]; then
  export PATH=$PATH:$(brew --prefix)/share/git-core/contrib/diff-highlight
elif [ "$(uname)" = 'Linux' ]; then
  export PATH=$PATH:/usr/share/doc/git/contrib/diff-highlight
fi

# Load local configuration if exists
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# For Claude Code
export PATH="/home/junk0612/.local/bin:$PATH"

for version in $(ls ~/.asdf/installs/golang); do
    export PATH=$PATH:~/.asdf/installs/golang/$version/go/bin
    export PATH=$PATH:~/.asdf/installs/golang/$version/bin
done
eval "$(git wt --init zsh)"
