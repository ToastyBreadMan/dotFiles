#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|

PROMPT_COMMAND=__prompt_command
export CLICOLOR=1

# Get what machine we are on
unameOut="$(uname -s)"
case "${unameOut}" in
	Linux*)     machine=Linux;;
	Darwin*)    machine=Mac;;
	CYGWIN*)    machine=Cygwin;;
	MINGW*)     machine=MinGw;;
	*)          machine="UNKNOWN:${unameOut}"
esac

# Character Types
BOLD="\[\e[1m\]"
DIM="\[\e[2m\]"
UNDER="\[\e[4m\]"
BLINK="\[\e[5m\]"
REVERSE="\[\e[7m\]"

# Color Definitions
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
BLUE="\[\e[34m\]"
MAGENTA="\[\e[35m\]"
CYAN="\[\e[36m\]"
LGRAY="\[\e[37m\]"
DGRAY="\[\e[90m\]"
LRED="\[\e[91m\]"
LGREEN="\[\e[92m\]"
LYELLOW="\[\e[93m\]"
LBLUE="\[\e[94m\]"
LMAGENTA="\[\e[95m\]"
LCYAN="\[\e[96m\]"
WHITE="\[\e[97m\]"
RESET="\[\e[0m\]"

# Environment variables
EDITOR=vim
VISUAL=vim
PROMPT_VERBOSE=false

# Aliases
alias ll='ls -l'
alias la='ls -la'
alias cp='cp -i'
alias pvim='vim -u NONE'
alias grep='grep --color=auto'
alias promptswap='if $PROMPT_VERBOSE; then PROMPT_VERBOSE=false; else PROMPT_VERBOSE=true; fi'

# Machine specific aliases
if [ $machine == 'Linux' ]; then
	alias ls='ls --color=always'
#elif [ $machine == 'Mac' ]; then
fi

# Add Mac path
export PATH=$PATH:$HOME/bin
if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi

# Prompt command
__prompt_command() {
	local EXIT="$?"

		PS1=""

		if $PROMPT_VERBOSE; then 
			PS1+="$LGREEN\u$RESET@\h:$LGRAY\W$RESET "
		else
			PS1+="$LGRAY\W$RESET "
		fi

		if [ $EXIT != 0 ]; then
			PS1+=">$RESET$LRED>$RESET$BOLD$RED>$RESET"
		else
			PS1+=">$RESET$LCYAN>$RESET$BOLD$CYAN>$RESET"
		fi
		
		PS1+=" "
}
