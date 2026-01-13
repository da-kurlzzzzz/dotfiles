#!/usr/bin/bash

device="88:0E:85:67:73:93"
bluetoothctl $(bluetoothctl info $device | grep "Connected: yes" -q && echo dis)connect $device
