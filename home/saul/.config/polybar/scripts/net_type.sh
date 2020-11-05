#!/usr/bin/env bash

wifi_connected=""
eth_connected=""
external_connected=""

wifi_interface="wlp3s0"
eth_interface="enp2s0f1"


spacer='  '
spacer_len=${#spacer}

raw_out="$spacer"

no_true_cond=true

if `nmcli -t dev status|grep $wifi_interface|cut -d: -f3|grep -q connected`; then
    wifi_ssid=`nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2|cut -d: -f2|xargs`
    if [ ! -z $wifi_ssid ]; then
	    conditional_spacer=" "
    fi
    raw_out="$raw_out$wifi_connected$conditional_spacer$wifi_ssid$spacer"
    no_true_cond=false
fi

if `nmcli -t dev status|grep $eth_interface|cut -d: -f3|grep -q connected`; then
    raw_out="$raw_out$eth_connected$spacer"
    no_true_cond=false
fi

if `nmcli -t dev status|grep -v $eth_interface|grep -v $wifi_interface|cut -d: -f3|grep -q connected`; then
    raw_out="$raw_out$external_connected$spacer"
    no_true_cond=false
fi

# trim the spacer at the beginning and end
if [ $no_true_cond = true ]; then
    raw_out="$raw_out$spacer"
fi
raw_out_len=${#raw_out}
substr_start=$(($spacer_len))
substr_length=$(($raw_out_len-2*$spacer_len))
out=${raw_out:$substr_start:$substr_length}

# trimming test
# echo *"$raw_out"*
# echo *"$out"*

echo "$out"
