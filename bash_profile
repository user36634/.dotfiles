if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

#    if test -e /usr/local/bin/brew; then
#        if [ -f `brew --prefix`/etc/bash_completion ]; then
#            . `brew --prefix`/etc/bash_completion
#        fi
#    fi

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
