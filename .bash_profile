# ~/.bash_profile

# run .bashrc
if [ -f "${HOME}/.bashrc" ]; then
    source ${HOME}/.bashrc
fi

# ssh-agent
SSH_KEY="${HOME}/.ssh/id_rsa"
if [ -z "${SSH_AUTH_SOCK}" -a -f "${SSH_KEY}" ]; then
    eval $(/usr/bin/ssh-agent -s) > /dev/null
    trap "kill ${SSH_AGENT_PID}" 0
    /usr/bin/ssh-add ${SSH_KEY}
fi
