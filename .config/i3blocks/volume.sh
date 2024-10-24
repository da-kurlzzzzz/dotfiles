#!/usr/bin/env bash

printf "%s " 𝅘𝅥𝅮
default=$(pactl get-default-sink)
pactl -f json list sinks |
jq -r '.[] | select(.name == "'$default'").volume."front-left".value_percent'
