#!/bin/bash

volstat=$(pactl list sinks) 
if [[ ($(echo "$volstat" | grep "Mute: yes") != "") ]]
then
    vol="Mute"
else
    vol="$(echo "$volstat" | grep '[0-9]\+%' | sed "s,.* \([0-9]\+\)%.*,\1,;1q")"
fi

if [[ ("$vol" != "Mute") ]]
then
    if [[ "$vol" -gt "70" ]] 
    then
	    icon="🔊"
    elif [[ "$vol" -lt "30" ]] 
    then
	    icon="🔈"
    else
	    icon="🔉"
    fi
    printf "%s %s%% \\n" "$icon" "$vol"
else
    icon="🔇"
    printf "%s %s \\n" "$icon" "$vol"
fi
