function power() {
    /usr/sbin/ioreg -l | awk 'BEGIN{a=0;b=0}
        $0 ~ "MaxCapacity" {a=$5;next}
        $0 ~ "CurrentCapacity" {b=$5;nextfile}
        END{printf("%.2f%%", b/a * 100)}';
}

function setenv() {
    if [ $# = 2 ]; then
        export $1=$2;
    else
        echo "Usage: setenv [NAME] [VALUE]";
    fi
}

function tabname {
    printf "\e]1;$1\a"
}

# Fun with color
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
fi

# Set aliases if available
if [ -f "$HOME/.aliases" ]; then
    source "$HOME/.aliases"
fi

# Set exports if available
if [ -f "$HOME/.exports" ]; then
    source "$HOME/.exports"
fi

# Set rbenv if exists
if ! x="$(type -p "rbenv")" || [ -z "x" ]; then
    eval "$(rbenv init -)"
fi

shopt -s histappend
