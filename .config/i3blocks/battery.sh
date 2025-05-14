#!/usr/bin/env bash

path=/sys/class/power_supply/BAT0
[ -d "$path" ] || exit 0
use=$(cat $path/status)

now=$(cat $path/energy_now)
full=$(cat $path/energy_full)
very_full=$(cat $path/energy_full_design)

percent=$(awk <<< "$now $full" '{print($1 * 100 / $2)}')
percent_nice=$(printf "%.2f" $percent)

printf "%s %s" "$use" $percent_nice

time_average() {
    DATA_FILE="/tmp/battery_time_data"
    local current_time=$(date +%s)
    local new_value=$1

    # Convert HH:MM:SS to seconds
    local value_seconds=$(echo "$new_value" | awk -F: '{print $1*3600 + $2*60 + $3}')

    # Add new measurement with timestamp
    echo "$current_time $value_seconds" >> "$DATA_FILE"

    # Calculate cutoff time (10 seconds ago)
    local cutoff_time=$((current_time - 10))

    # Process data: filter, calculate weighted average
    local total=0
    local total_weight=0
    local prev_time=$cutoff_time
    local temp_file=$(mktemp)

    # Filter old entries and create temp file with recent data
    awk -v cutoff="$cutoff_time" '$1 >= cutoff {print}' "$DATA_FILE" > "$temp_file"

    # Calculate time-weighted average
    while read -r timestamp seconds; do
        local time_diff=$((timestamp - prev_time))
        total=$((total + seconds * time_diff))
        total_weight=$((total_weight + time_diff))
        prev_time=$timestamp
    done < "$temp_file"

    # Handle remaining window (if any)
    local remaining_time=$((current_time - prev_time))
    if [ $remaining_time -gt 0 ]; then
        total=$((total + value_seconds * remaining_time))
        total_weight=$((total_weight + remaining_time))
    fi

    # Replace data file with only recent entries
    mv "$temp_file" "$DATA_FILE"

    # Calculate average (if we have data)
    if [ $total_weight -gt 0 ]; then
        local average_seconds=$((total / total_weight))
        # Convert back to HH:MM:SS
        printf "%02d:%02d:%02d\n" \
               $((average_seconds / 3600)) \
               $(( (average_seconds % 3600) / 60 )) \
               $((average_seconds % 60))
    else
        echo "$new_value"  # Fallback if no data
    fi
}

run_acpi() {
    remaining=$(acpi -b | awk '{print $5}')
    remaining=$(time_average $remaining)
    capacity=$(acpi -i | awk 'NR == 2 {print $13}')
    printf " ~%s" $remaining
    printf " (%s)" $capacity
}

command -v acpi &>/dev/null && run_acpi
echo
