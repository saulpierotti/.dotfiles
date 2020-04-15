# Antigen (plugin manager)-----------------------------------------
source /usr/share/zsh/share/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# plugins
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle autojump
antigen bundle zsh-users/zsh-completions
antigen bundle esc/conda-zsh-completion 
antigen bundle zsh-users/zsh-autosuggestions

# Tell Antigen that you're done.
antigen apply

# conda configs -----------------------------------------------------
source .condainit

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
export KEYTIMEOUT=1

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# reverse search
bindkey '^R' history-incremental-search-backward

# Use ranger to switch directories and bind it to ctrl-o
bindkey -s '^o' 'source ranger_launcher.sh\n'
bindkey -s '^[^o' 'source ranger_launcher_sudo.sh\n'

# open nautilus in working dir
bindkey -s '^f' 'nautilus .&; disown\n'
