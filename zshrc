# Run tmux but not in inf. loop
if [ "$TMUX" = "" ]; then exec tmux; fi

# No theme
ZSH_THEME=""

# Case-sensitive completion
CASE_SENSITIVE="true"

# Dots
COMPLETION_WAITING_DOTS="true"

#history auto complete
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git rails vi-mode tmux)

# For tmux window renaming
DISABLE_AUTO_TITLE=true

# ALIASES HERE >>>

# Rbenv for rails
eval "$(rbenv init -)"

# Postgresql host
export PGHOST=localhost

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Custom prompt
export PROMPT=$'$%{\033[1;37m%}%n%{\033[0m%}@%m: %(6~*%{\033[1;31m%}.../%3~%{\033[0m%}*%{\033[1;31m%}%~%{\033[0m%}) %{\033[32m%}$(git_prompt_info)%{\033[0m%} %# '
