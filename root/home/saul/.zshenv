# avoid nested ranger instances
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
	if [ -z "$@" ]; then
		/usr/bin/ranger "$RANGER_START"
	else
		/usr/bin/ranger "$@"
	fi
    else
        exit
    fi
}

# theme dark, breakes firefox
# set theme with gnome-tweaks, not here
#export GTK2_RC_FILES="/usr/share/themes/Adapta-Nokto"
#export GTK_THEME="Adapta-Nokto"

# set default terminal
export TERMCMD="i3-sensible-terminal"
export TERMINAL="kitty"
export TERM="xterm-kitty"

# text editor
export EDITOR="nvim"
export VISUAL="nvim"

# my custom scripts
export PATH="${PATH}:/home/saul/.scripts"
export PATH="${PATH}:/home/saul/.bioscripts/saul_python_bio"
export PATH="${PATH}:/home/saul/.bioscripts/shell_bioscripts"
export PYTHONPATH="${PYTHONPATH}:/home/saul/.bioscripts"

# t_coffee
export EMAIL_4_TCOFFEE="saulpierotti@gmail.com"

# modeller
export KEY_MODELLER="MODELIRANJE"

# ranger
export RANGER_START="/home/saul/Desktop"
