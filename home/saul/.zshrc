# Antigen (plugin manager)-----------------------------------------
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# plugins
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle git
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle esc/conda-zsh-completion 
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle autojump

# Tell Antigen that you're done.
antigen apply

# conda configs -----------------------------------------------------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/saul/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

# load startup file---------------------------------------------------
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec /home/saul/.scripts/startup.py
fi

# Manual configs------------------------------------------------------------------------------------

# Load my aliases
source ~/.zsh_aliases

# history (copied from autoconfig)
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# vim mode
bindkey -v

# reverse search
bindkey '^R' history-incremental-search-backward
