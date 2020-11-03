#!/usr/bin/env bash

disconnected=" "
wireless_connected=" "
ethernet_connected=" "
usb_connected=" "

ID="$(ip link | awk '/state UP/ {print $2}')"
ID2="$(ip link | awk '/state UNKNOWN/ {print $2}'|grep -v lo)"

if (ping -c 1 archlinux.org || ping -c 1 google.com || ping -c 1 bitbucket.org || ping -c 1 github.com || ping -c 1 sourceforge.net) &>/dev/null; then
    if [[ $ID == e* ]]; then
        echo "$ethernet_connected"
    elif [[ $ID == w* ]]; then
        echo "$wireless_connected"
    elif [[ $ID2 == e* ]]; then
        echo "$usb_connected"
    else
        echo "$disconnected"
    fi
else
    echo "$disconnected"
fi
