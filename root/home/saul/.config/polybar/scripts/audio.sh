#!/bin/sh

symbol_standard=
symbol_mute=
curr_volume=`pamixer --get-volume`
is_mute=`pamixer --get-mute`

if [ $is_mute = true ]; then
    out=$symbol_mute
else
    out="$symbol_standard  $curr_volume"
fi

echo "$out"
