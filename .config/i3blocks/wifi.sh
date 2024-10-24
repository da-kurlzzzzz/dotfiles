#!/usr/bin/env bash

systemctl is-active iwd >/dev/null || exit
dbm=$(awk -F "[. ]*" '/:/ { print $5; exit }' /proc/net/wireless || exit)
name=$(iwctl station wlan0 show | awk '/Connected network/ { print $3 }')
[ -z $name ] && exit
echo "$name: $dbm dbm"
