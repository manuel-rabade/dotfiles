# ~/.bashrc

# history
HISTFILESIZE=10000
HISTSIZE=5000
HISTCONTROL=ignoredups

# environment
export BLOCKSIZE=K
export LESS='-c -r -f'
export GREP_COLOR=31
export LC_CTYPE='es_MX.UTF-8'
export DICTIONARY='es_MX,en_US'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PATH="${PATH}:${HOME}/bin"

# test for an interactive shell
if [[ $- != *i* ]] ; then
        # shell is non-interactive
        return
fi

# window size
shopt -s checkwinsize

# prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >& /dev/null; then
    if [[ ${EUID} == 0 ]]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi

# title
if [[ "$TERM" =~ "xterm*|rxvt*" ]]; then
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
fi

# color
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

# lesspipe
if [ -x /usr/bin/lesspipe ]; then
    eval "$(SHELL=/bin/sh lesspipe)"
fi

# editor
if [ -x /usr/bin/emacs ]; then
    export EDITOR='/usr/bin/emacs'
fi

# bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# aliases
alias duff='diff -u'
alias yank='rsync -av --delete'
alias myscreen="screen -a -D -R -S ${USER}"
alias ec='emacs -nw'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# local bash
if [ -f ${HOME}/.bash_local ]; then
    source ${HOME}/.bash_local
fi
