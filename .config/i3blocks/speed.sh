#!/usr/bin/env bash

tau=1.5

reset_configs() {
    iface=$(ip address | awk '/inet.*brd/{print $NF}')

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
    dx=$(bc <<< "$x_cur - $x_old")

    time_cur=$(date +%s.%N)
    dt=$(bc <<< "$time_cur - $x_time")

    x_speed=$(bc <<< "$dx / $dt")

    alpha=$(printf "%f" $(bc -l <<< "1 - e(-$dt / $tau)"))
    x_avg=$(bc <<< "$alpha * $x_speed + (1 - $alpha) * $x_avg")

    echo $x_avg $x_cur $time_cur
}

to_human()
{
    bc <<< "$1 / 1024.0"
}

reset_configs

while true
do
    ip route | grep "default via [.[:digit:]]* dev $iface" 2>&1 >/dev/null || reset_configs
    read rx_avg rx_old rx_time < <(update_avg $rx_file $rx_avg $rx_old $rx_time)
    read tx_avg tx_old tx_time < <(update_avg $tx_file $tx_avg $tx_old $tx_time)

    echo $(to_human $rx_avg) ∇ ∆ $(to_human $tx_avg)
    sleep 2
done