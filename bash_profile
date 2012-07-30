if [ -n "$PS1" ]; then
    if [ $TERM = 'xterm-color' -o $TERM = 'xterm-256color' ]; then
    	COLOR_DEFAULT="[00m"
    	COLOR_OPTION0="[30m" # Black      | Dark Gray
    	COLOR_OPTION1="[31m" # Red        | Light Red
    	COLOR_OPTION2="[32m" # Green      | Light Green
    	COLOR_OPTION3="[33m" # Brown      | Yellow
    	COLOR_OPTION4="[34m" # Blue       | Light Blue
    	COLOR_OPTION5="[35m" # Purple     | Light Purple
    	COLOR_OPTION6="[36m" # Cyan       | Light Cyan
    	COLOR_OPTION7="[37m" # Light Gray | White
    	if [ `id -u` == '0' ]; then
    		COLOR_CHOICE=$COLOR_OPTION5
    	else
    		COLOR_CHOICE=$COLOR_OPTION2
    	fi
    	export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
    	export CLICOLOR=1
    	if [ `uname` == "Darwin" ]; then
    		export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
    		export LC_CTYPE=en_US.utf-8
    	else
    	alias ls='ls --color=auto'
    	fi
    fi
#    if test -e /usr/local/bin/brew; then
#        if [ -f `brew --prefix`/etc/bash_completion ]; then
#            . `brew --prefix`/etc/bash_completion
#        fi
#    fi

# OS X PATH is set by:
# 1. /private/etc/paths
# 2. /etc/paths.d/*
# 3. /etc/profile
# 4. export PATH="$PATH"
export PATH="/usr/local/share/python:$PATH"
export EDITOR='subl -w'
export PYTHONSTARTUP="$HOME/.pythonrc"
export VIRTUAL_ENV=""
export VIRTUAL_ENV_DISABLE_PROMPT=1
export DISTRIBUTE_DISABLE_VERSIONED_EASY_INSTALL_SCRIPT=1
export PIP_RESPECT_VIRTUALENV=true
export NODE_PATH="/usr/local/lib/node_modules"
export LESS=FRSX
export HISTSIZE=10000
export HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:cd:[bf]g:brew *:tso:pwd:exit"
export PS1="
\[\e${COLOR_OPTION3}\]>\[\e${COLOR_DEFAULT}\] "
export PS2="  "

alias ..="cd .."
alias ipext="dig +short myip.opendns.com @resolver1.opendns.com"
alias ipen0="ipconfig getifaddr en0"
alias ipen1="ipconfig getifaddr en1"
alias rvim="gvim --remote-silent"
alias edit=$EDITOR
alias qldebug='qlmanage -p "$@" >& /dev/null'
alias wifidiag='open "/System/Library/CoreServices/Wi-Fi Diagnostics.app"'
alias cdsrc="cd /usr/local/src && pwd"
alias cdsites="cd /usr/local/sites && pwd"
alias cdplone="cd /usr/local/zope/plone && pwd"
alias cmdcount="history | awk '{print \$2}' | awk 'BEGIN {FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail | sort -nr"
alias rmdotds="find . -name '*.DS_Store' -type f -delete"
alias rmpyc="find . -name '*.pyc' -type f -delete"
alias tso="date '+Terminal Saved Output (%Y-%m-%d %H-%M-%S)'|pbcopy"
alias dstamp="date '+%y%m%d'|pbcopy && pbpaste"
alias tstamp="date '+%Y-%m-%d %H-%M-%S'|pbcopy && pbpaste"
alias ddate="date '+%B %e, %Y'|sed 's/  / /;'|pbcopy && pbpaste"
alias ttime="date '+%H:%M %p'|sed 's/  / /;'|pbcopy && pbpaste"
alias On="date '+%a, %b %_d, %Y at %l:%M %p'|sed 's/  / /g;'|pbcopy && pbpaste"
alias fixmongod="rm /data/db/mongod.lock && mongod --repair"

shopt -s histappend

power() {
    /usr/sbin/ioreg -l | awk 'BEGIN{a=0;b=0}
        $0 ~ "MaxCapacity" {a=$5;next}
        $0 ~ "CurrentCapacity" {b=$5;nextfile}
        END{printf("%.2f%%", b/a * 100)}'
}
fi
