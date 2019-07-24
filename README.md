# Dotfiles for easy trashtop setup
Various setup stuff so test laptop setup goes faster

## xterm-256color.terminfo.txt
The file is so iTerm2 can understand how Italic text works  

Run `tic -o ~/.terminfo xterm-256color.terminfo.txt` to compile it to the TERMINFO file  
Test with `echo /`tput sitm/`italics/`tput ritm/` /`tput smso/`standout/`tput rmso/``
