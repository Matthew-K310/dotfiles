#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

calendar=(
  # label
  label.color="$ROSE"
  label.shadow.drawing=off

  background.color="0x40232323"

  # functionality
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
