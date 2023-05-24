#!/bin/bash

# @requires: brightnessctl


get_brightness () {
  (( br = $(brightnessctl get) * 100 / $(brightnessctl max) ))
  echo $br
}

if [[ $1 == "set" ]]; then
  light -S $2
fi

if [[ $1 == "br" ]]; then
  get_brightness
fi
