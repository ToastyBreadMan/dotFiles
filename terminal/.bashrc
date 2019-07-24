# Bashrc stufffs
PROMPT_COMMAND=__prompt_command

# Color Definitions
MAGENTA="\e[0;35m"
RED="\e[0;31m"
RESET="\e[m"

# Alias
alias ls='ls -G'

# Add Mac path
export PATH=/usr/local/bin:$PATH
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
