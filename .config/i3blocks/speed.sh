#!/usr/bin/env bash

rx_file=/sys/class/net/enp2s0/statistics/rx_bytes
tx_file=/sys/class/net/enp2s0/statistics/tx_bytes
tau=1.5

to_mb()
{
    bc <<< "$1 / 1024"
}

rx_avg=0
tx_avg=0
time=$(date +%s.%N)
rx=$(cat $rx_file)
tx=$(cat $tx_file)

while true
do
    cur_time=$(date +%s.%N)
    dt=$(bc <<< "$cur_time - $time")
    dt=$(awk -v t=$(date +%s.%N) "BEGIN { print t - $time }")

    cur_rx=$(cat $rx_file)
    cur_tx=$(cat $tx_file)
    drx=$(bc <<< "$cur_rx - $rx")
    dtx=$(bc <<< "$cur_tx - $tx")

    rx_speed=$(bc <<< "$drx / $dt")
    tx_speed=$(bc <<< "$dtx / $dt")
    alpha=$(printf "%f" $(bc -l <<< "1 - e(-$dt / $tau)"))

    rx_avg=$(bc <<< "$alpha * $rx_speed + (1 - $alpha) * $rx_avg")
    tx_avg=$(bc <<< "$alpha * $tx_speed + (1 - $alpha) * $tx_avg")
    time=$cur_time
    rx=$cur_rx
    tx=$cur_tx

    echo $(to_mb $rx_avg) ∇ ∆ $(to_mb $tx_avg)
    sleep 2
done
