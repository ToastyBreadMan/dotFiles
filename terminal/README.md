# Dotfiles for easy terminal
Moving from machine to machine (or VM) sucks, these make my life easier

## xterm-256color.terminfo.txt
The file is so iTerm2 can understand how Italic text works  

Run `tic -o ~/.terminfo xterm-256color.terminfo.txt` to compile it to the TERMINFO file  
Test with ``echo `tput sitm`italics`tput ritm` `tput smso`standout`tput rmso` ``

## tmux-256color.terminfo
Tmux has problems with italic text too so you need to run this as well

Run `tic -x tmux-256color.terminfo` to get tmux to read the TERMINFO file correctly

## Vim
Vim file in progress that has options to install plugins from the command line

Vim 8 has it's own plugin manager that works well and allows for optional packages you can activate
if you need

I will probably never stop messing with my vimrc, so use at your own risk

Run `:call Plug_Install()` to install the _Dracula_ colorscheme (my favorite) and _Syntastic_

## Zsh
Work in progress zsh

## Bash
Basic bash config

## Tmux
Yet another not to specialized tmux config

NOTE: The tmux control bar does not show if there is only one window active

## .Xresources
Mainly colors and some keybindings for terminals that use Xresources

TODO: move this to a better folder later
