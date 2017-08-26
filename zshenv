#ZSHENV
#Kilo9
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin

# Rbenv for rails
export PATH=$HOME/.rbenv/bin:$PATH

if [ -x "$(command -v rbenv)" ]; then
    eval "$(rbenv init -)"
fi

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

echo "zshenv sourced"
