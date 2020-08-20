#!/bin/sh

icon=👾

if ! updates=$(checkupdates 2> /dev/null | wc -l ); then
    updates=0
fi

printf " %s %s \\n" "$icon"  "$updates"
