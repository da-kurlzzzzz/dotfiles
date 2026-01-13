#!/usr/bin/env bash

set -eu

REPOSITORY="/run/media/$USER/borg/backups"

[ -d "$REPOSITORY" ] || { echo "no backup directory found"; exit 1; }
borg info "$REPOSITORY" &>/dev/null || {
    echo "backup directory not recognized"
    echo "run 'borg info $REPOSITORY'"
    echo "you might need to run borg init $REPOSITORY -e none"
    exit 2
}

borg create --verbose --stats --exclude-from $HOME/.config/borg/exclude $REPOSITORY::'{hostname}-{now:%Y-%m-%dT%H:%M:%S}' $HOME
borg prune --verbose --stats --list --glob-archives='{hostname}-*' --keep-hourly=6 --keep-daily=5 $REPOSITORY
borg compact --verbose $REPOSITORY

echo Backup successful
echo View files by running "'borg mount $REPOSITORY::<current backup name> ./contents'"
