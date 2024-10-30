#!/usr/bin/env bash

path=/sys/class/power_supply/BAT0
use=$(cat $path/status)

now=$(cat $path/energy_now)
full=$(cat $path/energy_full)
very_full=$(cat $path/energy_full_design)

percent=$(bc <<< "scale=2; $now * 100 / $very_full")
echo $use $percent
date >> /home/kevin/battery-log
echo $use $percent >> /home/kevin/battery-log
# bc <<< "scale=2; $now * 100 / $very_full"

