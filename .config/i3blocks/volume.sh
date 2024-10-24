#!/usr/bin/env bash

printf "%s " 𝅘𝅥𝅮
default=$(pactl get-default-sink)

mute=$(pactl -f json list sinks |
       jq -r '.[] | select(.name == "'$default'").mute')

[ $mute = true ] && echo mute && exit

pactl -f json list sinks |
jq -r '.[] | select(.name == "'$default'").volume."front-left".value_percent'
