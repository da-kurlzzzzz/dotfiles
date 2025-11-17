#!/usr/bin/env bash

pane=$(tmux display-message -p "#S:#I.#P")
[ -z "$pane" ] || vim_server_pid=$(pgrep -f "servername $pane")
[ -z "$vim_server_pid" ] && cmd="tmux split-window -l 85%"
$cmd vim --servername $pane --remote-tab-silent "$@"
vim_server_pid=$(pgrep -f "servername $pane")
tmux select-pane -t $(awk < /proc/$vim_server_pid/environ -F= 'BEGIN{RS="\0"} /^TMUX_PANE=/{print $2}')
