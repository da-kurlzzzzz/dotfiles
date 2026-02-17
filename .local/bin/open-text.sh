#!/usr/bin/env bash

is_openable_text()
{
    mime=
    for f in "$@"; do
        # not a file - skip it
        [ -f "$f" ] || continue

        mime=$(file -Lib "$f")
        # file is definitely text
        [[ "$mime" =~ ^(text/.*|inode/x-empty.*|.*charset=utf-8|.*charset=.*ascii)$ ]] && continue

        if command -v handlr &>/dev/null; then
            mime=$(handlr mime "$f" | tail -n 1 | cut -f2)
            # file was mislabeled earlier
            [[ "$mime" =~ ^text/.*$ ]] && continue
        fi
        echo unsupported mime type
        echo "$f:" "$mime"
        return 1
    done
    return 0
}

is_tmux_available()
{
    command -v tmux &>/dev/null || return 1
    [ -z "$TMUX" ] && return 1
    return 0
}

if ! is_openable_text "$@"; then
    echo trying xdg-open
    xdg-open "$@"
elif is_tmux_available; then
    pane=$(tmux display-message -p "#S:#I.#P")
    [ -z "$pane" ] || vim_server_pid=$(pgrep -f "servername $pane")
    [ -z "$vim_server_pid" ] && cmd="tmux split-window -l 80%"
    $cmd vim --clientserver socket --servername $pane --remote-tab-silent "$@"
    [ -z "$vim_server_pid" ] || tmux select-pane -t $(awk < /proc/$vim_server_pid/environ -F= 'BEGIN{RS="\0"} /^TMUX_PANE=/{print $2}')
else
    vim "$@"
fi

