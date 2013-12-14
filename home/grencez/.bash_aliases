
# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

alias l='ls -tr'
alias ll='ls -lhtr'
alias la='l -a'
alias lla='ls -lahtr'

alias c='cd'

alias info='info --vi-keys'

alias vnc='vncviewer'

alias mplayer='mplayer -stop-xscreensaver'

