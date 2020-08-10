#!/bin/sh

ans=$(echo -e "no\nyes" | dmenu -c -h 40 -p "Do you want to shutdown")

if [[ ($ans == "yes") ]]
then
    killall dwm
fi
