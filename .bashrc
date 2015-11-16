# ~/.bashrc

# environment
export BLOCKSIZE=K
export LESS="-c -r -f"
export HISTFILESIZE=10000
export HISTSIZE=5000
export GREP_COLOR=31
export HISTCONTROL="ignoredups"
export LC_CTYPE="es_ES.UTF-8"
export PATH="${PATH}:${HOME}/bin"
export DICTIONARY="es_MX,en_US"
export XSESSION="Xfce4"

# test for an interactive shell
if [[ $- != *i* ]] ; then
        # shell is non-interactive
        return
fi

# editor
if [ -x /usr/bin/emacs ]; then
    export EDITOR="/usr/bin/emacs"
    alias ec="emacs -nw"
fi

# aliases
alias grep="grep --color=auto"
alias ls="ls --color=auto -F -h"
alias duff="diff -u"
alias yank="rsync -av --delete"

if [ -x /usr/bin/screen ]; then
    alias myscreen="screen -a -D -R -S ${USER}"
fi

# source local bash
if [ -f "${HOME}/.bash_local" ]; then
    source ${HOME}/.bash_local
fi
