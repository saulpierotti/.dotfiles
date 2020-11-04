#!/usr/bin/env bash

wifi_connected="    "
eth_connected="    "
external_connected="    "

wifi_interface="wlp3s0"
eth_interface="enp2s0f1"

wifi_ssid=`nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2|cut -d: -f2`

spacer='  '

out="$spacer"

if `nmcli -t dev status|grep $wifi_interface|cut -d: -f3|grep -q connected`; then
    out="$out$wifi_connected$wifi_ssid$spacer"
fi

if `nmcli -t dev status|grep $eth_interface|cut -d: -f3|grep -q connected`; then
    out="$out$eth_connected$spacer"
fi

if `nmcli -t dev status|grep -v $eth_interface|grep -v $wifi_interface|cut -d: -f3|grep -q connected`; then
    out="$out$external_connected$spacer"
fi

echo $out
