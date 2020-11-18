#!/bin/sh
numlockx &
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
/usr/bin/prime-offload
export QT_QPA_PLATFORMTHEME=qt5ct

# this is for SLiM, which gives %session% as argument to xinit
# what is after :- is executed if $1 is not given
exec i3

sudo /usr/bin/prime-switch
