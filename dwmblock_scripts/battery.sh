#!/bin/sh

capacity="$(cat /sys/class/power_supply/BAT1/capacity)%"
#status=$(sed "s/[Dd]ischarging//;s/[Cc]harging//;s/[Ff]ull//" /sys/class/power_supply/BAT1/status)
status=$(sed "s/[Dd]ischarging/d/;s/[Cc]harging//;s/[Ff]ull/d/" /sys/class/power_supply/BAT1/status)
if [[ ($status == "d") ]]
then
    if [[ ${capacity:0:-1} -gt "90" ]]
    then
        status=""
    elif [[ ${capacity:0:-1} -gt "75" ]]
    then 
        status=""
    elif [[ ${capacity:0:-1} -gt "50" ]]
    then 
        status=""
    elif [[ ${capacity:0:-1} -gt "35" ]]
    then 
        status=""
    else
        status=""
    fi
    if [[ ${capacity:0:-1} -lt "40" ]]
    then
        twmnc -t "Warning" -c "Low battery, please connect the charger" -d 10000 
    fi
fi
printf %s%s%% " $status " "$capacity "
