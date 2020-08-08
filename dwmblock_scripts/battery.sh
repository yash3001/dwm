#!/bin/sh

capacity="$(cat /sys/class/power_supply/BAT1/capacity)% "
status=$(sed "s/[Dd]ischarging//;s/[Cc]harging//;s/[Ff]ull//" /sys/class/power_supply/BAT1/status)

printf %s%s%% "$status " "$capacity"
