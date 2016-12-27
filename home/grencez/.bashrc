
source /etc/profile

PS1='\[\033[01;32m\]\u\[\033[00m\]\$ '

umask 022

#export INTEL_LICENSE_FILE=$HOME/.static/lic
export PATH="$HOME/local/bin:$HOME/bin:$PATH"
export PATHSETP=1

#export LANG="en_GB.UTF-8"
export LANG="C"

export EDITOR=`which vim`
export GDIFF='gvim -fd'
#export GDIFF=xxdiff
export EIX_LIMIT=0

export PAPERSIZE=letter

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
#export TSOCKS_CONF_FILE=~/.tsocksrc

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Set vi mode
set -o vi


