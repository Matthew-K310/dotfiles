#!/bin/bash

source "$CONFIG_DIR/colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"
if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  [3-9][0-9] | 100)
    COLOR=$PINE
    ;;
  [1-2][0-9])
    COLOR=$GOLD
    ;;
  [0-9])
    COLOR=$LOVE
    ;;
esac

OUTPUT="${PERCENTAGE}%"

if [[ "$CHARGING" != "" ]]; then
  OUTPUT="${PERCENTAGE}^"
fi

sketchybar --set "$NAME" label="B ⋮ $OUTPUT" "label.color=$COLOR"
