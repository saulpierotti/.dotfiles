#!/usr/bin/env bash

disconnected=" "

if (fping -q -x1 google.com github.com archlinux.org) &>/dev/null; then
    echo ""
else
    echo "$disconnected"
fi
