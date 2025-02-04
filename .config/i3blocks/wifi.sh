#!/usr/bin/env bash

systemctl is-active iwd >/dev/null || exit 0
dbm=$(awk -F "[. ]*" '/:/ { print $5; exit }' /proc/net/wireless || exit 0)
name=$(iwctl station wlan0 show | awk '/Connected network/ { print $3 }')
[ -z $name ] && exit 0
echo "$name: $dbm dbm"
