#!/usr/bin/env bash

path=/sys/class/power_supply/BAT0
[ -d "$path" ] || exit 0
use=$(cat $path/status)

now=$(cat $path/energy_now)
full=$(cat $path/energy_full)
very_full=$(cat $path/energy_full_design)

percent=$(awk <<< "$now $very_full" '{print($1 * 100 / $2)}')
percent_nice=$(printf "%.2f" $percent)

echo $use $percent_nice
