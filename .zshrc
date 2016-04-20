# prompt
PROMPT='%F{cyan}%B%n%b%f at %F{green}%d%f> '
RPROMPT='%F{yellow}%B[%D %*]%b%f'

# completion
autoload -U compinit
compinit
setopt correct
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
setopt auto_cd

#history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt auto_pushd
setopt pushd_ignore_dups

# Use Japanese
export LANG=ja_JP.UTF-8

eval "$(rbenv init -)"

# Aliases
alias g=git
alias ga='git add'
alias gst='git status'
alias gd='git diff'
alias gaa='git add -A'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gf='git fetch'
alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gsta='git stash'
alias gstp='git stash pop'
alias gm='git merge'
alias gc='git commit'
alias gcm='git commit -m'
alias glg='git log --stat'
alias glgp='git log -p'

alias diff='diff -u'
alias reset='source ~/.zshrc'
alias config='vi ~/dotfiles/.zshrc'
alias l='ls -al'
