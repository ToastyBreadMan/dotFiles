# Bashrc stufffs
PROMPT_COMMAND=__prompt_command
export CLICOLOR=1

unameOut="$(uname -s)"
case "${unameOut}" in
	Linux*)     machine=Linux;;
	Darwin*)    machine=Mac;;
	CYGWIN*)    machine=Cygwin;;
	MINGW*)     machine=MinGw;;
	*)          machine="UNKNOWN:${unameOut}"
esac

# Color Definitions
RED="\[\e[0;35m\]"
MAGENTA="\[\e[0;31m\]"
RESET="\[\e[m\]"

# Aliases

# Machine specific aliases
if [ $machine == 'Linux' ]; then
	alias ls='ls --color=always'
	alias grep='grep --color=auto'
fi

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
