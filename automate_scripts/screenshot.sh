#!/bin/bash

TIME=$(date -R | grep ..:..:.. -o)
scrot "%Y-%m-%d_${TIME}.png" -e 'mv $f ~/Pictures/Screenshots/'
