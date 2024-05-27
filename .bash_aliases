# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git one-liners
alias git-status-r='for X in *; do [ ! -d ${X} ] && continue; [ ! -d ${X}/.git ] && continue; echo "================================================================================"; cd ${X}; git remote -v; git status; cd ..; done'
alias git-pull-r='for X in *; do [ ! -d ${X} ] && continue; [ ! -d ${X}/.git ] && continue; echo "================================================================================"; cd ${X}; git remote -v; git pull --all; cd ..; done'
alias git-fetch-r='for X in *; do [ ! -d ${X} ] && continue; [ ! -d ${X}/.git ] && continue; echo "================================================================================"; cd ${X}; git remote -v; git fetch --all; cd ..; done'

# misc
alias duff='diff -u'
alias yank='rsync -av --delete'
alias myscreen="screen -a -D -R -S ${USER}"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
