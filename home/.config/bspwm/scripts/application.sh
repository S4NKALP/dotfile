#!/bin/sh

xprop -root -spy _NET_ACTIVE_WINDOW | while read -r wid; do
    wid=$(echo $wid | cut -d ' ' -f 5)
    if [ "$wid" != "0x0" ]; then
        cls=$(xprop -id $wid WM_CLASS)
        cls=$(echo $cls | cut -d ' ' -f 4)
        cls=$(echo $cls | sed -e 's/^.//;s/.$//;s/^\(.\)/\u\1/')
        echo "$cls"
    else
        echo "0xjack-S4NKALP"
    fi
done