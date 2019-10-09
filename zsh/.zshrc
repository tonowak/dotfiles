ZSH=/usr/share/oh-my-zsh/
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
ZSH_THEME="robbyrussell-modified"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(
  git
)

# export LANG=pl_PL.UTF-8
export LANG=en_US.UTF-8

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

alias cp="cp -i"


# To delete:

export CGO_CFLAGS="-I/tmp/trizen-tonowak/lxd/src/go/deps/sqlite/ -I/tmp/trizen-tonowak/lxd/src/go/deps/libco/ -I/tmp/trizen-tonowak/lxd/src/go/deps/raft/include/ -I/tmp/trizen-tonowak/lxd/src/go/deps/dqlite/include/"
export CGO_LDFLAGS="-L/tmp/trizen-tonowak/lxd/src/go/deps/sqlite/.libs/ -L/tmp/trizen-tonowak/lxd/src/go/deps/libco/ -L/tmp/trizen-tonowak/lxd/src/go/deps/raft/.libs -L/tmp/trizen-tonowak/lxd/src/go/deps/dqlite/.libs/"
export LD_LIBRARY_PATH="/tmp/trizen-tonowak/lxd/src/go/deps/sqlite/.libs/:/tmp/trizen-tonowak/lxd/src/go/deps/libco/:/tmp/trizen-tonowak/lxd/src/go/deps/raft/.libs/:/tmp/trizen-tonowak/lxd/src/go/deps/dqlite/.libs/"

