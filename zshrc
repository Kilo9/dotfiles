# Run tmux but not in inf. loop
if [ "$TMUX" = "" ]; then exec tmux; fi

 #history stuff
 HISTFILE=$HOME/.zsh_history
 HISTSIZE=10000
 SAVEHIST=10000
 setopt append_history
 setopt hist_expire_dups_first
 setopt hist_ignore_space
 setopt inc_append_history
 setopt share_history

 # fix zsh annoying history behavior
 h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

 autoload -Uz up-line-or-beginning-search
 autoload -Uz down-line-or-beginning-search
 zle -N up-line-or-beginning-search
 zle -N down-line-or-beginning-search
 bindkey '\eOA' up-line-or-beginning-search
 bindkey '\e[A' up-line-or-beginning-search
 bindkey '\eOB' down-line-or-beginning-search
 bindkey '\e[B' down-line-or-beginning-search 


# No theme
ZSH_THEME=""

# Case-sensitive completion
CASE_SENSITIVE="true"

# Dots
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git rails vi-mode tmux)

# For tmux window renaming
DISABLE_AUTO_TITLE=true

# ALIASES HERE >>>
alias la="ls -la"
alias gs="git status"
alias gg="git graph"
alias rgrep="grep -rn --exclude-dir={tmp,log,test}"
alias c="clear"
alias be="bundle exec"
alias re="rbenv exec"
alias gdc="git diff --cached"

# Rbenv for rails
eval "$(rbenv init -)"

# Postgresql host
export PGHOST=localhost

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Custom prompt
export PROMPT=$'$%{\033[1;37m%}%n%{\033[0m%}@%m: %(6~*%{\033[1;31m%}.../%3~%{\033[0m%}*%{\033[1;31m%}%~%{\033[0m%}) %{\033[32m%}$(git_prompt_info)%{\033[0m%} %# '
export PATH="/usr/local/bin:/Applications/Racket v6.4/bin":$PATH
# Haskell
export PATH=~/.cabal/bin:$PATH

alias la="ls -la"
alias gs="git status"
alias gg="git graph"
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc"
alias tmrc="vim ~/.tmux_conf"
alias vi="vim"

# activator
export PATH="/Users/kilo/dev/activator-dist-1.3.10/bin":$PATH

#mysql
export LD_LIBRARY_PATH=/usr/local/mysql/lib:$LD_LIBRARY_PATH
export PATH="/usr/lib/libmysqlclient.18.dylib":$PATH

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
