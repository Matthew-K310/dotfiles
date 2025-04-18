#!/bin/bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

# if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
#     sketchybar --set $NAME background.drawing=on
# else
#     sketchybar --set $NAME background.drawing=off
# fi

echo "called with $1"
echo "$FOCUSED_WORKSPACE"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on
else
    sketchybar --set $NAME background.drawing=off
fi
