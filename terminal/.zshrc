# Setup
setopt PROMPT_SUBST
autoload -Uz colors compinit
colors && compinit 

# Config options

## Show return code on right side of prompt
local SET_ERROR_RPROMPT=1
## Show git updates on right side of prompt
local SET_GIT_RPROMPT=1

# History

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

## Dont save blank entries
setopt hist_reduce_blanks

# Functions

## Show return code of last function (other than 0)
## Source: https://zenbro.github.io/2015/07/23/show-exit-code-of-last-command-in-zsh
function check_last_exit_code() {
	local LAST_EXIT_CODE=$?
	if [[ $LAST_EXIT_CODE -ne 0 ]]; then
		local EXIT_CODE_PROMPT=' '
		EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
		EXIT_CODE_PROMPT+="%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%}"
		EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
		echo "$EXIT_CODE_PROMPT"
	fi
}

# Prompt
PROMPT='%n:%{$fg[magenta]%}%~%{$reset_color%}> '

RPROMPT=''
if [[ $SET_ERROR_RPROMPT -ne 0 ]]; then
	RPROMPT+='$(check_last_exit_code)'
fi

# Aliases
alias ls="ls -G"

# Add Mac path
export PATH=/usr/local/bin:$PATH
