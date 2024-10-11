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

# completion
fpath=(${ASDF_DIR}/completions $fpath)
if [ "$(uname)" = 'Darwin' ] && type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi
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
export LSCOLORS=cxfxcxdxbxegedabagacad

# bind keys like emacs
bindkey -e

# Global aliases
alias -g hrk='heroku'

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
alias glom='git pull origin master'
alias glg='git log --stat'
alias glgp='git log -p'
alias gm='git merge'
alias gp='git push'
alias gpo='git push origin'
alias gpof='git push origin --force-with-lease'
alias gpom='git push origin master'
alias grb='git rebase'
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
alias co='git checkout `git branch | fzf | sed -e "s/\* //g" | awk "{print \$1}"`'

## rails
alias bi='bundle install'
alias be='bundle exec'
alias bu='bundle update'
alias bo='bundle open'

## others
alias diff='diff -u'
alias reset='source ~/.zshrc'
alias zconf='vi ~/dotfiles/.zshrc'
alias zenvconf='vi ~/dotfiles/.zshenv'
alias gconf='vi ~/dotfiles/.gitconfig'
alias vconf='vi ~/dotfiles/.vimrc'
alias nvconf='vi ~/dotfiles/init.lua'
alias tconf='vi ~/dotfiles/.tmux.conf'
alias copconf='vi ~/dotfiles/.rubocop.yml'
alias gignore='vi ~/dotfiles/.gitignore_global'
alias l='ls -alGF'
alias c='cd'
alias v='nvim'
alias vi='nvim'
alias t='tmux'
alias tm='tmuxinator'
alias adconf='addconf'
alias dfconf='diffconf'
alias psconf='pushconf'
alias stconf='statconf'
alias memo='vim ~/Documents/memo.md'
alias kpt='vim ~/Documents/kpt.md'
alias gopen='hub browse $(ghq list | fzf | cut -d "/" -f 2,3)'
alias cop='rubocop --format fuubar --display-cop-names'
alias f='fillin'
alias d='docker'
alias dc='docker-compose'
alias vplug='v ~/.vim/plugins/on_start.toml'
alias vlazy='v ~/.vim/plugins/lazy.toml'

source ~/dotfiles/sync.sh
source ~/dotfiles/etc.sh
source ~/dotfiles/parallel_tests.sh

# npm
export PATH="$PATH:$HOME/.nodebrew/current/bin"

# default editor
export EDITOR=nvim

# for fzf
export FZF_DEFAULT_OPTS="--extended --select-1 --exit-0 --reverse --ansi"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PostgreSQL
export PGDATA=/usr/local/var/postgres

export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

if [ "$(uname)" = 'Darwin' ]; then
  . $(brew --prefix asdf)/libexec/asdf.sh
elif [ "$(uname)" = 'Linux' ]; then
  . $HOME/.asdf/asdf.sh
fi

export PATH="$PATH:$HOME/.deno/bin"
source /usr/share/doc/fzf/examples/key-bindings.zsh

# for git/diff-highlight
if [ "$(uname)" = 'Darwin' ]; then
  export PATH=$PATH:$(brew --prefix)/share/git-core/contrib/diff-highlight
elif [ "$(uname)" = 'Linux' ]; then
  export PATH=$PATH:/usr/share/doc/git/contrib/diff-highlight
fi
