#!/bin/bash

#sketchybar --set $NAME icon="$(date '+%a %d. %b')" label="$(date '+%H:%M')"
# sketchybar --set "$NAME" label="$(date '+%A, %b %d %Y ⋮ %H:%M')"
# sketchybar --set "$NAME" label="$(date '+%A, %B %d ⋮ %H:%M')"
sketchybar --set "$NAME" label="$(date '+%A, %m/%d ⋮ %H:%M')"
