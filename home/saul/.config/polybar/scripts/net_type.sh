#!/usr/bin/env bash

wireless_connected=" "
ethernet_connected=" "
usb_connected=" "
disconnected=" "

ID="$(ip link | awk '/state UP/ {print $2}')"
ID2="$(ip link | awk '/state UNKNOWN/ {print $2}'|grep -v lo)"
ssid=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2|cut -d: -f2)

if [[ $ID == e* ]]; then
    echo "$ethernet_connected"
elif [[ $ID == w* ]]; then
    echo "$wireless_connected $ssid"
elif [[ $ID2 == e* ]]; then
    echo "$usb_connected"
else
    echo "$disconnected"
fi
