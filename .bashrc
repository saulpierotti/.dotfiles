#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# colors

# this is my old config taken from lucasmith
# export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# this is the current powerline-like prompt
if [ "$TERM" == "xterm-256color" ]; then
	source /home/saul/.fancy-bash-prompt.sh
fi

# load aliases
source ~/.bash_aliases

# use vi keybindings in shell
set -o vi

# User-specifc ENV variables
# They do not work if put in .bash_profile
# Other ENVs are in /etc/profile

# my custom scripts
export PATH=$PATH:"/home/saul/.scripts"
export PATH=$PATH:"/home/saul/bioscripts"

# for modeller
export PYTHONPATH="/home/saul/packages/MODELLER9.23/modlib"
export PYTHONPATH=$PYTHONPATH":/home/saul/packages/MODELLER9.23/lib/x86_64-intel8/python3.3"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH":/home/saul/packages/MODELLER9.23/lib/x86_64-intel8"

# source anaconda init and deactivation
source ~/.condainit
