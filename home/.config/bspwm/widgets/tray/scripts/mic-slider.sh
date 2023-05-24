#!/usr/bin/env bash

if [[ "$(amixer get Capture | grep 'Left:' | awk -F'[][]' '{ print $4 }' | tr -d '%')" = "on" ]]; then
    vol=$(amixer get Capture | grep 'Left:' | awk -F'[][]' '{ print $2 }' | tr -d '%')

    if [[ ${vol} -ge 80 ]]; then
        echo "󰍬"
    elif [[ ${vol} -ge 40 ]]; then
        echo "󰍬"
    elif [[ ${vol} -ge 10 ]]; then
        echo "󰍬"
    else
        echo "󰍭"
    fi
else
    echo "󰍭"
fi
