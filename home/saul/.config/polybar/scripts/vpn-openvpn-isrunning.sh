#!/bin/sh

connection=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1)
name=$(pgrep -a openvpn$ | head -n 1 | awk '{print $NF }' | cut -d '.' -f 1|rev|cut -d '/' -f '1'|rev)

if pgrep -a openvpn$ |head -n 1| grep -q nordvpn; then
  connection=""
fi

if [ -n "$connection" ]; then
    echo "  OpenVPN: $name"
else 
    echo ""
fi
