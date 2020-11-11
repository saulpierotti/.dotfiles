numlockx &
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
/usr/bin/prime-offload
export DESKTOP_SESSION=gnome
export QT_QPA_PLATFORMTHEME=qt5ct
exec i3
sudo /usr/bin/prime-switch
