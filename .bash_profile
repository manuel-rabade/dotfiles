# ~/.bash_profile

# run .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f ${HOME}/.bashrc ]; then
        source ${HOME}/.bashrc
    fi
fi

# run ssh-agent & ssh-add in non-desktop logins
if [ $(uname) = "Linux" ]; then
    if [ -f ${HOME}/.ssh/id_ed25519 -a -z "$DESKTOP_SESSION" ]; then
        eval $(/usr/bin/ssh-agent -s) > /dev/null
        trap "kill ${SSH_AGENT_PID}" 0
        /usr/bin/ssh-add ${HOME}/.ssh/id_ed25519
    fi
fi

# desktop environment config
export ELECTRON_OZONE_PLATFORM_HINT=wayland
