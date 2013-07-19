if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

autoload -U colors && colors
autoload -U promptinit && promptinit

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

if [ -f $HOME/.exports ]; then
    source $HOME/.exports
fi
export PROMPT=$'\n# '
export CLICOLOR=true
export GREP_COLOR='1;33'

if [ -f $HOME/.aliases ]; then
    source $HOME/.aliases
fi

if [ -f $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_STYLES[precommand]='fg=green'
    ZSH_HIGHLIGHT_STYLES[path]='fg=blue'
fi

if [ -f $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
    source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

PROMPT=$'\n%{[01;31m%}>%{[00m%} '
#PROMPT2=$'\n%{[01;31m%}%_>%{[00m%} '
#PROMPT3=$'\n%{[01;31m%}?#%{[00m%} '
#PROMPT4=$'\n%{[01;31m%}+%N:%i>%{[00m%} '
PSVAR='>:%:#'
SPROMPT='%{[01;35m%}CORRECT>%{[01;37m%}%r%{[01;35m%}(ynea)%{[31;33m%}?%{[00m%} '

setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

fpath=(/usr/local/share/zsh-completions $fpath)

autoload -U compinit
if [ -f $HOME/.zcompdump ]; then
    rm -f ~/.zcompdump
fi
compinit -u

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"
