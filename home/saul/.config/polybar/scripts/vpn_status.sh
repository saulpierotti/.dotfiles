#!/bin/sh

spacer='  '
symbol=" "
spacer_len=${#spacer}
raw_out="$spacer"
no_true_cond=true

if nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2 | grep -q Connected; then
    nordvpn_country="NordVPN-$(nordvpn status | grep Country | cut -d ':' -f2|xargs)"
    raw_out="$raw_out$nordvpn_country$spacer"
    no_true_cond=false
fi


# ovpn connection test
if  pgrep -a openvpn$ |head -n 1| grep -vq nordvpn; then
    name=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1|rev|cut -d '/' -f '1'|rev)
    raw_out="$raw_out$name$spacer"
    no_true_cond=false
fi

# trim the spacer at the beginning and end
if [ $no_true_cond = true ]; then
    raw_out="$raw_out$spacer"
    symbol_conditional=""
else
    symbol_conditional="$symbol "
fi
raw_out_len=${#raw_out}
substr_start=$(($spacer_len))
substr_lenght=$(($raw_out_len-2*$spacer_len))
out=$symbol_conditional${raw_out:$substr_start:$substr_lenght}

echo "$out"
