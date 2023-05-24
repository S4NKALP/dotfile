#!/bin/bash

# @requires: amixer

SINK=$(amixer scontrols | grep -oP "'[^']*'" | sed "s/'//g" | head -n 1)


get_percentage () {
    per=$(amixer get $SINK | grep -o '[0-9]*%' | head -n 1 | tr -d '%')
    echo "${per}%"
}



get_vol () {
  local percent=$(get_percentage)
  echo $percent | tr -d '%'
}

if [[ $1 == "vol" ]]; then
  get_vol
fi

if [[ $1 == "set" ]]; then
  val=$(echo $2 | tr '.' ' ' | awk '{print $1}')
  if test $val -gt 100; then
    val=100
  fi
  amixer set $SINK $val%
fi


STATUS=$(awk '/%/ {gsub(/[\[\]]/,""); print $6}' <(amixer sget Master) | awk 'FNR == 1')
toggle() {
    if [ $STATUS == "on" ]; then
        amixer set Master toggle
        notify-send --icon=volume-level-muted --urgency=normal "Volume is muted." "Volume has been muted, your PC has been shut the fucked up."
    else
        amixer set Master toggle
        notify-send --icon=volume-level-high --urgency=normal "Volume has been turned on." "Sound is now on, you will hear farts!"
    fi
}

status() {
    if [ $STATUS == "on" ]; then
        echo "󰕾"
    else
        echo "󰖁"
    fi
}

if [[ $1 == "--toggle" ]]; then
    toggle
    elif [[ $1 == "--status" ]]; then
    status
fi