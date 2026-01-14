#!/usr/bin/env bash

is_active=false

systemctl is-active timeshift-on-mount.service >/dev/null && is_active=true
systemctl --user is-active borg-on-mount.service >/dev/null && is_active=true

if $is_active
then
    printf "backup in progress\n\n#00FF00\n#000000\n"
fi
