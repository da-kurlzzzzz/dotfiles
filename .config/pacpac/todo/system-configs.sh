#!/usr/bin/env bash

MYDIR="$1"
ROOTDIR="$MYDIR/rootfiles"

for f in $(find ${ROOTDIR} -type f)
do
    echo -n overwrite "$f" "(Y/n)":
    read ans
    [ -z "$ans" -o y = "$ans" ] && echo ${MYDIR}/wish ${f/*rootfiles/}
done
