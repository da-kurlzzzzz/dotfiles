#!/usr/bin/bash

device="0C:AE:BD:69:03:0E"
bluetoothctl $(bluetoothctl info $device | grep "Connected: yes" -q && echo dis)connect $device
