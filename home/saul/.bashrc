#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# this is my old config taken from lucasmith
# export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# this is the powerline-like prompt
if [ "$TERM" == "xterm-256color" ]; then
	source /home/saul/.fancy-bash-prompt.sh
fi

# bash history settings
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# all the envs are in /etc/profile

# load aliases
source ~/.bash_aliases

# use vi keybindings in shell
set -o vi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/saul/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/saul/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/saul/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/saul/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
