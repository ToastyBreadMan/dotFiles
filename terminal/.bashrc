# Bashrc stufffs
PROMPT_COMMAND=__prompt_command
export CLICOLOR=1

# Color Definitions
RED="\[\e[0;35m\]"
MAGENTA="\[\e[0;31m\]"
RESET="\[\e[m\]"

# Alias
#alias ls='ls --color=always'
#alias grep='grep --color=auto'

# Add Mac path
export PATH=$PATH:$HOME/bin
if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi

# Prompt command
__prompt_command() {
	local EXIT="$?"

	PS1=""

	if [ $EXIT != 0 ]; then
		PS1+="[$RED$EXIT$RESET] "
	fi

	PS1+="\u:$MAGENTA\W$RESET> "
}

#PS1="\u:$MAGENTA\W$RESET> "
