#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

volume=(
  # label
  "label.color=$LOVE"
  # background.color="$VOLUME_BACKGROUND"

  # functionality
  update_freq=60
  script="$PLUGIN_DIR/volume.sh"
)

sketchybar --add item volume right \
           --set volume "${volume[@]}" \
           --subscribe volume volume_change
