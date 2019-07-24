# Dotfiles for easy trashtop setup
Various setup stuff so test laptop setup goes faster

## xterm-256color.terminfo.txt
The file is so iTerm2 can understand how Italic text works  

Run `tic -o ~/.terminfo xterm-256color.terminfo.txt` to compile it to the TERMINFO file  
Test with `echo /`tput sitm/`italics/`tput ritm/` /`tput smso/`standout/`tput rmso/``

## tmux-256color.terminfo
Tmux has problems with italic text too so you need to run this as well

Run `tic -x tmux-256color.terminfo` to get tmux to read the TERMINFO file correctly

## Vim
Basic vimrc, if you don't want the theme delete the `colorscheme` statement at the top

## Zsh
Basic zshell config

## Bash
Another basic bash config

## Tmux
Yet another not to specialized tmux config

NOTE: The tmux control bar does not show if there is only one window active
