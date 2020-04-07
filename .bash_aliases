# Default options
alias ls='ls --color=auto'
alias grep="grep --color=auto"
alias plink="plink --noweb"

# built-in commands aliases
alias p="sudo pacman"
alias q="exit"
alias v="$VISUAL"
alias c="clear"
alias r="reset"
alias g="git"
alias sv="sudoedit"
alias SS="sudo systemctl"
alias vpn="nordvpn"
alias please="sudo"
alias gping="ping google.com"
alias py="python"
alias slowfox="trickle -s -t0.1 -u10 -d500 firefox"

# custom scripts
alias vpnr="nordvpn.sh"
alias reducepdf="reducepdf.sh"
alias usb="mountdev.sh"
alias awake="xscreensaver_awake.sh"
alias bluec="bluetooth_connect.sh"
alias blued="bluetooth_disconnect.sh"
alias gitup="git_update.sh"

# frequent tasks
alias clipboard="xclip -selection clipboard -i"
alias ca="conda activate"

# from packages
#alias mustang="/home/saul/packages/MUSTANG_v3.2.3/bin/mustang-3.2.3"
#alias modeller="/home/saul/packages/MODELLER9.23/bin/mod9.23"
#alias jce="cd /home/saul/packages/RCSB_Symmetry_20131206_hack/ ; ./runCESymm.sh"
#alias art="/home/saul/packages/artemis/art"
#alias cytoscape="/home/saul/.scripts/cytoscape_launcher.sh"

# config shortcuts
alias bashrc="$VISUAL ~/.bashrc"
alias aliases="$VISUAL ~/.bash_aliases"
alias profile="sudoedit /etc/profile"
alias vimrc="$VISUAL ~/.config/nvim/init.vim"
