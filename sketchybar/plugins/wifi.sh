#!/bin/sh

SSID=$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')

# sketchybar --set "$NAME" label="W ⋮ $SSID"

if [ -z "$SSID" ]; then
  STATUS="Disconnected"
else
  STATUS="Connected"
fi

sketchybar --set "$NAME" label="W ⋮ $STATUS"
