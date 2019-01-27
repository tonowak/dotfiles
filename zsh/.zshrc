ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(
  git
)

export LANG=pl_PL.UTF-8
# export LANG=en_US.UTF-8

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
source $ZSH/oh-my-zsh.sh

# user config:

if [[ -r ~/.aliasrc ]]; then
  . ~/.aliasrc
fi

if [[ -r ~/src/aliases.sh ]]; then
  . ~/src/aliases.sh
fi


