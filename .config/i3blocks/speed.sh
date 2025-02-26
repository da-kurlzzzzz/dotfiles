#!/usr/bin/env bash

tau=1.5
state_file="/tmp/i3blocks_speed_state"

check_iface() {
    new_iface=$(ip route get 8.8.8.8 | sed -E 's/.*dev (\S*).*/\1/;q')
    [ $new_iface = $iface ]
}

reset_configs() {
    iface=$({ ip route get 8.8.8.8 || echo "dev lo"; } | sed -E 's/.*dev (\S*).*/\1/;q')

    rx_file=/sys/class/net/$iface/statistics/rx_bytes
    tx_file=${rx_file/rx/tx}

    rx_time=$(date +%s.%N)
    tx_time=$(date +%s.%N)

    rx_avg=0
    tx_avg=0
    rx_old=$(cat $rx_file)
    tx_old=$(cat $tx_file)
}

update_avg()
{
    x_file=$1
    x_avg=$2
    x_old=$3
    x_time=$4

    x_cur=$(cat $x_file)
    time_cur=$(date +%s.%N)

    x_avg=$(awk <<< "$x_cur $x_old $time_cur $x_time $tau $x_avg" '
        {
            dx = $1 - $2
            dt = $3 - $4
            x_speed = dx / dt
            alpha = 1 - exp(-dt / $5)
            x_avg = alpha * x_speed + (1 - alpha) * $6
            print(x_avg)
        }
    ')

    echo $x_avg $x_cur $time_cur
}

to_human()
{
    awk <<< "$1" '{print(int($1 / 1024.0))}'
}

if [ -f "$state_file" ]; then
    source "$state_file"
else
    reset_configs
fi

if ! check_iface; then
    reset_configs
fi

read -r rx_avg rx_old rx_time < <(update_avg $rx_file $rx_avg $rx_old $rx_time)
read -r tx_avg tx_old tx_time < <(update_avg $tx_file $tx_avg $tx_old $tx_time)

echo $(to_human $rx_avg) ∇ ∆ $(to_human $tx_avg)

# Save the current state to the state file
cat > $state_file <<EOF
iface=$iface
rx_file=$rx_file
tx_file=$tx_file
rx_avg=$rx_avg
tx_avg=$tx_avg
rx_old=$rx_old
tx_old=$tx_old
rx_time=$rx_time
tx_time=$tx_time
EOF
