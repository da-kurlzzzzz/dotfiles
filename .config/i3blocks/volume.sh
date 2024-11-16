#!/usr/bin/env bash

default=$(pactl get-default-sink)

mute=$(pactl -f json list sinks |
       jq -r '.[] | select(.name == "'$default'").mute')

[ $mute = true ] && echo mute && exit

pactl -f json list sinks |
jq -r '.[] | select(.name == "'$default'").volume | map(select(has("value_percent")))[0].value_percent'
