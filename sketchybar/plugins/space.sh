#!/bin/bash

#echo space.sh $'FOCUSED_WORKSPACE': $FOCUSED_WORKSPACE, $'SELECTED': $SELECTED, NAME: $NAME, SENDER: $SENDER  >> ~/aaaa

# source "$CONFIG_DIR/colors.sh"
#
# COLOR=$BACKGROUND_2
# if [ "$SELECTED" = "true" ]; then
#   COLOR=$IRIS
# fi
#
# sketchybar --set "space.$SID" "background.border_color=$COLOR"

echo "called with $1"
echo "$FOCUSED_WORKSPACE"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on
else
    sketchybar --set $NAME background.drawing=off
fi
