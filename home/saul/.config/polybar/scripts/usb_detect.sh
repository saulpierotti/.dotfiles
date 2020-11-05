#!/bin/bash

usb_devs=`lsblk -l -o PATH,LABEL|grep -v '/dev/sda'|grep -v '/dev/sd. '|grep /dev|tr '\n' ' '|xargs`

if [ -n "`lsblk -l -o PATH,LABEL|grep -v '/dev/sda'|grep -v '/dev/sd. '|grep /dev`" ]; then
    echo $usb_devs
else
    echo ""
fi
