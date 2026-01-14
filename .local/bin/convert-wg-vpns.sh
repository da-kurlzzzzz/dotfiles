#!/usr/bin/env bash

# https://hide-my-name.app/vpn/router/#router-another

set -eu

usage()
{
    echo "Usage: $0 <directory with clean vpn configs>"
}

[ "$#" -lt 1 ] && { usage; exit 1; }

FROM="$1"
INTO="$(dirname "$FROM")/patched"
DOMAINS=(grok.com)
IPS=()
for d in ${DOMAINS[@]}
do
    IPS+=($(dig +short @1.1.1.1 $d))
done

printf "%s\n" ${IPS[@]}

[ -d "$INTO" ] && rm -r "$INTO"
mkdir -p "$INTO"

find "$FROM" -type f -name "*.conf" | while read f
do
    printf "%s\n" "$f"
    renamed="${f/*\/}"
    renamed="${renamed/.conf/}"
    renamed="$(tr -d 'a-z' <<< ${renamed})"
    renamed="hmn-${renamed}.conf"
    new_f="$INTO/$renamed"
    cp --update=none-fail "$f" "$new_f"
    for ip in ${IPS[@]}
    do
        sed -i '/^DNS = /d' "$new_f"
        sed -i '\|^AllowedIPs = 0.0.0.0/0$|s|=.*|=|' "$new_f"
        sed -i "/^AllowedIPs =/s/\$/ $ip\\/32,/" "$new_f"
    done
    sed -i '/^AllowedIPs = /s/,$//' "$new_f"
done
