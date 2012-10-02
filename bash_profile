if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

#    if test -e /usr/local/bin/brew; then
#        if [ -f `brew --prefix`/etc/bash_completion ]; then
#            . `brew --prefix`/etc/bash_completion
#        fi
#    fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
