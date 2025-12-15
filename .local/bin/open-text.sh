#!/usr/bin/env bash

mime=
for f in "$@"
do
    [ -f "$f" ] || continue
    mime=$(file -Lib "$f")
    case "$mime" in
        text/*)
            continue
            ;;
        inode/x-empty*)
            continue
            ;;
        *)
            echo unsupported mime type
            echo "$f:" "$mime"
            echo maybe try xdg-open
            exit 1
            ;;
    esac
done

pane=$(tmux display-message -p "#S:#I.#P")
[ -z "$pane" ] || vim_server_pid=$(pgrep -f "servername $pane")
[ -z "$vim_server_pid" ] && cmd="tmux split-window -l 80%"
$cmd vim --servername $pane --remote-tab-silent "$@"
[ -z "$vim_server_pid" ] || tmux select-pane -t $(awk < /proc/$vim_server_pid/environ -F= 'BEGIN{RS="\0"} /^TMUX_PANE=/{print $2}')
