#!/usr/bin/env bash

set -x

for d in $(bluetoothctl <<< "devices Paired" | grep '^Device' | cut -d' ' -f2)
do
    if bluetoothctl <<< "info $d" | grep -i audio &>/dev/null
    then
        bluetoothctl -t 2 <<< "connect $d"
    fi
done

sinks=""
sep=""
for d in $(bluetoothctl <<< "devices Connected" | grep '^Device' | cut -d' ' -f2)
do
    sink="bluez_output.${d//:/_}.1"
    echo "$sink"
    pactl set-sink-mute "$sink" false
    pactl set-sink-volume "$sink" 100%
    sinks="${sinks}${sep}${sink}"
    echo "$sinks"
    [ -z "$sep" ] && sep=","
done

pactl unload-module module-combine-sink
pactl load-module module-combine-sink "sinks=$sinks"
pactl set-default-sink combined
