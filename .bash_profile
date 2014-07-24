# ~/.bash_profile

# run .bashrc
if [ -f "${HOME}/.bashrc" ]; then
    source ${HOME}/.bashrc
fi

# ssh-agent
SSH_KEY="${HOME}/.ssh/id_rsa"
if [ -f "${SSH_KEY}" ]; then
    if [ -n "$DESKTOP_SESSION" ];then
        eval $(gnome-keyring-daemon --start --components=ssh)
        export SSH_AUTH_SOCK
    else
        eval $(/usr/bin/ssh-agent -s) > /dev/null
        trap "kill ${SSH_AGENT_PID}" 0
        /usr/bin/ssh-add ${SSH_KEY}
    fi
fi
