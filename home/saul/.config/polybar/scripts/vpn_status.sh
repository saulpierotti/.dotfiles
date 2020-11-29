#!/bin/bash

spacer='    '
symbol="  "
spacer_len=${#spacer}

# nordvpn
if nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2 |
    grep -q Connected; then
    nordvpn_country="NordVPN-$(nordvpn status | grep Country | cut -d ':' -f2 |
        xargs)"
    raw_out="$symbol$nordvpn_country$spacer"
fi

# ovpn
if pgrep -a openvpn$ | head -n 1 | grep -vq nordvpn && pgrep -a openvpn$ |
    head -n 1 | grep -vq nm-openvpn; then
    name=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' |
        cut -d '.' -f 1 | rev | cut -d '/' -f '1' | rev)
    raw_out="$raw_out$symbol$name$spacer"
fi

# networkmanager vpn
if nmcli connection show --active | grep -q vpn; then
    name="$(nmcli connection show --active | grep vpn | cut -d' ' -f1)"
    raw_out="$raw_out$symbol$name$spacer"
fi

raw_out_len=${#raw_out}
substr_lenght=$((raw_out_len - spacer_len))

if [ $substr_lenght -gt 0 ]; then
    out=${raw_out::$substr_lenght}
    echo "$out"
else
    echo ""
fi
