# prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats ' (%s:%b)'
precmd (){
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    psvar[1]=$vcs_info_msg_0_
}
PROMPT='%F{cyan}%B%n%b%f at %F{green}%~%f%F{magenta}%1v%f> '
RPROMPT='%F{yellow}%B[%D %*]%b%f'

# completion
autoload -U compinit
compinit
setopt correct
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt auto_cd

#history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
source ~/.enhancd/enhancd.sh

# directory stack
setopt pushd_ignore_dups

# Use Japanese
export LANG=ja_JP.UTF-8

eval "$(rbenv init -)"

# bind keys
bindkey -e

# Global aliases
alias -g hrk='heroku'

# Aliases
## git
alias g=git
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gbD='git branch -D'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gc='git commit'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gf='git fetch'
alias glg='git log --stat'
alias glgp='git log -p'
alias gm='git merge'
alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin master'
alias grb='git rebase'
alias grh='git reset HEAD'
alias grhh='git reset --hard HEAD'
alias grm='git remote'
alias grs='git reset'
alias gst='git status'
alias gsta='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'

## rails
alias bi='bundle install'
alias be='bundle exec'
alias bu='bundle update'

## others
alias diff='diff -u'
alias reset='source ~/.zshrc'
alias zconf='vi ~/dotfiles/.zshrc'
alias gconf='vi ~/dotfiles/.gitconfig'
alias vconf='vi ~/dotfiles/.vimrc'
alias tconf='vi ~/dotfiles/.tmux.conf'
alias l='ls -alG'
alias subl='vim'
alias vi='vim'
alias clr='clear'
alias t=tmux

source ~/dotfiles/sync.sh
source ~/dotfiles/etc.sh
