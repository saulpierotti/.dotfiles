#!/usr/bin/env bash

wireless_connected=" "
ethernet_connected=" "
usb_connected=" "

ID="$(ip link | awk '/state UP/ {print $2}')"
ID2="$(ip link | awk '/state UNKNOWN/ {print $2}'|grep -v lo)"

if [[ $ID == e* ]]; then
    echo "$ethernet_connected"
elif [[ $ID == w* ]]; then
    echo "$wireless_connected"
elif [[ $ID2 == e* ]]; then
    echo "$usb_connected"
else
    echo ""
fi
