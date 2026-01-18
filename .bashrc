# ~/.bashrc

# test for an interactive shell
case $- in
    *i*) ;;
      *) return;;
esac

# shell history
HISTFILESIZE=10000
HISTSIZE=5000
HISTCONTROL=ignoredups

# shell options
shopt -s checkwinsize
shopt -s histappend

# shell environment config
export BLOCKSIZE=K
export LESS='-c -r -f'
export GREP_COLORS='mt=31'
export LC_CTYPE='es_MX.UTF-8'
export DICTIONARY='es_MX,en_US'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PATH="${PATH}:${HOME}/bin:${HOME}/.local/bin"

# make less friendly for non-text
if [ -x /usr/bin/lesspipe ]; then
    eval "$(SHELL=/bin/sh lesspipe)"
fi

# chroot?
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# fancy prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >& /dev/null; then
    if [[ ${EUID} == 0 ]]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi

# term title
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# ls colors
if [ -x /usr/bin/dircolors ]; then
    if [ -r ~/.dircolors ]; then
        eval "$(dircolors -b ~/.dircolors)"
    else
        eval "$(dircolors -b)"
    fi
    alias ls='ls --color=auto -F -h'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    alias ls='ls -F -h'
fi

# emacs
if [ -n $(command -v emacs) ]; then
    export EDITOR=emacs
    alias ec='emacs -nw'
fi

# aliases
if [ -f ${HOME}/.bash_aliases ]; then
    source ${HOME}/.bash_aliases
fi

# local config
if [ -f ${HOME}/.bash_local ]; then
    source ${HOME}/.bash_local
fi

# bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
