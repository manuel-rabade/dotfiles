# ~/.bash_profile

# run .bashrc
if [ -f ${HOME}/.bashrc ]; then
    source ${HOME}/.bashrc
fi

# ssh-agent
if [ -f ${HOME}/.ssh/id_ed25519 -a -z "$DESKTOP_SESSION" -a $(uname) != "Darwin" ]; then
   eval $(/usr/bin/ssh-agent -s) > /dev/null
   trap "kill ${SSH_AGENT_PID}" 0
   /usr/bin/ssh-add ${HOME}/.ssh/id_ed25519
fi
