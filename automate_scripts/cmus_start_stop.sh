#!/bin/sh

if ! pgrep -x cmus ; then
  st -e cmus
else
  cmus-remote -u
fi
