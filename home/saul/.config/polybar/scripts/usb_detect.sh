#!/bin/bash

symbol=""
usb_devs=`lsblk -l -o PATH,LABEL|grep -v '/dev/sda'|grep -v '/dev/sd. '|grep /dev|tr '\n' ' '|xargs`

if [[ ! -z "$usb_devs" ]]; then
    spacer="  "
fi

# echo *"$symbol$spacer$usb_devs"*
echo "$symbol$spacer$usb_devs"
