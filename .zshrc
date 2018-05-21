#!/bin/zsh

export ZSH=~/.oh-my-zsh

ZSH_THEME="mh"
ZSH_THEME="ys"
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

plugins=(
    git brew aws docker vagrant python
)

export GPG_TTY=$(tty)
export GPGKEY=9AECBF60B37C3708C1EC1FF1EDAC0E3FCB1B3FEB
export PINENTRY_USER_DATA="USE_CURSES=1"
export EDITOR=nvim
export GOPATH="$HOME/Code/Go"
export PATH="$HOME.cargo/bin:$GOPATH/bin:$PATH:/usr/local/opt/python@2/bin"
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock

[ ! -S ~/.ssh/ssh_auth_sock ] && eval `ssh-agent` && ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
ssh-add -l | grep "The agent has no identities" && ssh-add

[ -f $HOME/.bash-insulter/src/bash.command-not-found ] && source $HOME/.bash-insulter/src/bash.command-not-found

if [ "$(hostname -s)" = "skylake"  ]; then
    alias vim=nvim
    export PATH=/usr/local/opt/python/libexec/bin:$PATH
    export VIRTUALENVWRAPPER_PYTHON=$(which python)
    [ -f /usr/local/bin/virtualenvwrapper_lazy.sh ] && source /usr/local/bin/virtualenvwrapper_lazy.sh
fi

if [ "$(hostname -s)" = "nehalem"  ]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv2
    export WORKON_HOME=~/.virtualenvs
    source /usr/bin/virtualenvwrapper_lazy.sh
    alias vim=nvim
    alias mutt=neomutt
fi

alias weather="curl wttr.in/Berlin"

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

