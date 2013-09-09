# ~/.bash_profile

# run .bashrc
if [ -f "$HOME/.bashrc" ]; then
    source $HOME/.bashrc
fi

# ssh-agent
# if [ -f "$HOME/.ssh/id_dsa" ]; then 
#     SSH_AGENT=/usr/bin/ssh-agent
#     SSH_ADD=/usr/bin/ssh-add
#     SSH_X_ASKPASS=/usr/bin/ssh-askpass-fullscreen

#     if [ -n "$DISPLAY" -a -x "$SSH_X_ASKPASS" ]; then 
#         SSH_ASKPASS=$SSH_X_ASKPASS
#     fi
    
#     if [ -z "$SSH_AUTH_SOCK" -a -x "$SSH_AGENT" -a -x "$SSH_ADD" ]; then
#         eval $($SSH_AGENT -s) > /dev/null
#         trap "kill $SSH_AGENT_PID" 0
#         $SSH_ADD $HOME/.ssh/id_dsa
#     fi
# fi
