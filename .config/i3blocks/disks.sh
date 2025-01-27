#!/usr/bin/env bash

udisksctl status | awk 'NR > 2 { printf "%s%s", (NR == 3 ? "" : " "), $NF }'
awk '/Dirty/{
    size=$2
    if (size > 999)
        printf " -%.0fMB...", size / 1024
}' /proc/meminfo
echo
