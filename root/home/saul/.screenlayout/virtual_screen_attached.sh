#!/bin/sh
xrandr --addmode VIRTUAL1 1024x768
xrandr --output eDP1 --primary --mode 1366x768 --pos 1280x256 --rotate normal --output HDMI1 --off --output VIRTUAL1 --mode 1024x768 --pos 0x0 --rotate normal
