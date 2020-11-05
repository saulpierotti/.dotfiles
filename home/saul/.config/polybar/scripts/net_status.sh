#!/usr/bin/env bash

wifi_connected=""
eth_connected=""
external_connected=""
connection_limited=""
disconnected=""
generic=""

wifi_interface="wlp3s0"
eth_interface="enp2s0f1"


spacer='  '
no_true_cond=true
wifi_out=""
eth_out=""
ext_out=""
gen_out=""
wifi_ssid=""


if `nmcli -t dev status|grep $wifi_interface|cut -d: -f3|grep -q connected`; then
    int_ssid=`nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2|cut -d: -f2|xargs`
    if [ ! -z $int_ssid ]; then
	    wifi_ssid=$spacer$int_ssid
    fi
    wifi_out="$wifi_connected$spacer"
    no_true_cond=false
fi

if `nmcli -t dev status|grep $eth_interface|cut -d: -f3|grep -q connected`; then
    eth_out="$eth_connected$spacer"
    no_true_cond=false
fi

if `nmcli -t dev status|grep -v $eth_interface|grep -v $wifi_interface|cut -d: -f3|grep -q connected`; then
    ext_out="$external_connected$spacer"
    no_true_cond=false
fi

# add a general icon in case nothing else worked
if [ $no_true_cond = true ]; then
    gen_out="$generic$spacer"
fi

# if there is no connectivity report it
if `nmcli networking connectivity check|grep -q full` ; then
    conn_out=""
elif `nmcli networking connectivity check|grep -q limited` ; then
    conn_out="$connection_limited"
elif `nmcli networking connectivity check|grep -q none` ; then
    conn_out="$disconnected"
else
    echo "bug in net_status.sh"
fi

# compose the message
raw_out="$spacer$eth_out$ext_out$gen_out$wifi_out"

# trim the ends
spacer_len=${#spacer}
raw_out_len=${#raw_out}
substr_start=$(($spacer_len))
substr_length=$(($raw_out_len-2*$spacer_len))
out=${raw_out:$substr_start:$substr_length}

# trimming test
# echo *"$raw_out"*
# echo *"$out"*
# echo *"$wifi_ssid"*
# echo *"$conn_out"*


echo "$out$conn_out$wifi_ssid"

