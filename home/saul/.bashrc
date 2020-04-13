#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# this is my old config taken from lucasmith
# export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# this is the current powerline-like prompt
if [ "$TERM" == "xterm-256color" ]; then
	source /home/saul/.fancy-bash-prompt.sh
fi

# all the envs are in /etc/profile

# load aliases
source ~/.bash_aliases

# use vi keybindings in shell
set -o vi

# source anaconda init and deactivation
source ~/.condainit

# resets the view so that I don't see ranger previews in the terminal when I open it
clear
