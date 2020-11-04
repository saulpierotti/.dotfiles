#!/usr/bin/env bash

limited=" "
disconnected="  "


if `nmcli networking connectivity check|grep -q full` ; then
    echo ""
elif `nmcli networking connectivity check|grep -q limited` ; then
    echo "$limited"
elif `nmcli networking connectivity check|grep -q none` ; then
    echo "$disconnected"
else
    echo "bug in ping_status.sh"
fi
