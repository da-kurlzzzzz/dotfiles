#!/usr/bin/env bash

#set -x

tau=15
state_file="/tmp/i3blocks_battery_state"

path=/sys/class/power_supply/BAT0
[ -d "$path" ] || exit 0

status=$(cat "$path/status")
percent=$(awk < "$path/energy_now" -v full="$(cat "$path/energy_full")" '{printf "%.2f", $1 * 100 / full}')

acpi_time_to_seconds() {
    local t="$1"
    # expects HH:MM:SS or MM:SS
    if [[ $t =~ ^([0-9]+):([0-9]{2}):([0-9]{2})$ ]]; then
        echo $(( 10#${BASH_REMATCH[1]} * 3600 + 10#${BASH_REMATCH[2]} * 60 + 10#${BASH_REMATCH[3]} ))
    elif [[ $t =~ ^([0-9]+):([0-9]{2})$ ]]; then
        echo $(( 10#${BASH_REMATCH[1]} * 60 + 10#${BASH_REMATCH[2]} ))
    else
        echo 0
    fi
}

seconds_to_hhmmss() {
    local s=$1
    printf "%02d:%02d:%02d" $((s/3600)) $(( (s%3600)/60 )) $((s%60))
}

load_state() {
    if [[ -f $state_file ]]; then
        source "$state_file"
    else
        prev_time=0
        ema=0
        prev_status="$status"
        prev_now=$(date +%s)
    fi
}

save_state() {
    cat > "$state_file" <<EOF
prev_time=$ema
ema=$ema
prev_status="$status"
prev_now=$now
EOF
}

now=$(date +%s)

raw_remaining=$(acpi -b | awk -F', ' '{print $3}' | awk '{print $1}')
# [[ $raw_remaining ]] || exit 0

seconds=$(acpi_time_to_seconds "$raw_remaining")

load_state

if [[ $status != "$prev_status" ]]; then
    ema=$seconds
else
    dt=$((now - prev_now))
    if (( dt < 1 )); then dt=1; fi

    alpha=$(awk -v dt="$dt" -v tau="$tau" 'BEGIN {print 1 - exp(-dt / tau)}')
    ema=$(awk -v s="$seconds" -v e="$ema" -v a="$alpha" 'BEGIN {print int(a * s + (1 - a) * e)}')
fi

printf "%s %.2f%%" "$status" "$percent"

if (( ema > 60 )); then
    printf " ~%s" "$(seconds_to_hhmmss "$ema")"
fi

capacity=$(acpi -i | awk 'NR == 2 {print $13}')
printf " (%s)" $capacity

echo

save_state

# vim: ft=bash
