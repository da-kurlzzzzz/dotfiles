#!/bin/bash

SAVEFILE="password.txt"
test -f $SAVEFILE || exec cat
jq --indent 4 --slurpfile pwd $SAVEFILE '."rpc-password" |= $pwd[0]'
