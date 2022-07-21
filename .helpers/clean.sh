#!/bin/bash

SAVEFILE=".helpers/password.txt"
if ! test -f $SAVEFILE; then
    touch $SAVEFILE
fi

TMPFILE="$(mktemp password.XXX.txt)"

tee >(jq '."rpc-password"' > $TMPFILE) | jq --indent 4 '."rpc-password" |= ""'

if ! diff $TMPFILE - <<< '""' &>/dev/null; then
    if ! diff $TMPFILE $SAVEFILE &>/dev/null; then
        cp $TMPFILE $SAVEFILE
    fi
fi

rm $TMPFILE
