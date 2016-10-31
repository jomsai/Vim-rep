#!/bin/bash

##====My .bash_profile for this USER only======##
##====Alias via kirsle.net/wizards/ps1.html====##
PS1="\[$(tput bold)\]\[$(tput setaf 3)\]\t\[$(tput setaf 2)\][\[$(tput setaf 4)\] \u \[$(tput setaf 1)\]]==> \[$(tput setaf 3)\]\h \[$(tput setaf 6)\] \W ]\[$(tput bold)\]\[$(tput setaf 2)\][ $?! ]\[$(tput setaf 4)\][[>\[$(tput setaf 1)\]\\$ \[$(tput sgr0)\]"

#export PS1='\033[107;38;5;199m \]\t \u \033[0;107;32m \w \033[33;48;5;52m [ \$?! ]==>$NC$'

# Custom bash prompt via kirsle.net/wizards/ps1.html
#export PS1="\T [\u] \w::[ \$?! ]-->\\$ \[$tput sgr0)\]"

##===========Setting Shell Sources=============##
[[ -s ${HOME}/.profile ]] && source ${HOME}/.profile
[[ -s ${HOME}/.bashrc ]] && source ${HOME}/.bashrc


##==========Paths and Bash Variables===========##
#export PATH=$HOME/bin:$PATH
#export MAIL=$HOME/Maildir/
#export LESS=-X
export EDITOR=vim VISUAL=vim
export LANG=en_US.UTF-8
export SHELL=/bin/bash

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# Make sure .bashrc is sourced
# if unsure of source file do a seq of exec check
#http://www.thegeekstuff.com/2008/10/execution-sequence-for-bash_profile-bashrc-bash_login-profile-and-bash_logout/
# for MacOS
#export BASH_ENV='~/.bash_profile'
# Linux
export BASH_ENV='~/.bashrc'

# works for both Linux & MacOS
if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi