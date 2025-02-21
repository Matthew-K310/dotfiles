#!/bin/bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7")

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
 # Skip workspaces 8, 9, and 10
    if [[ "$sid" -ge 8 ]]; then
        continue
    fi

    sketchybar --add item space."$sid" center \
        --subscribe space."$sid" aerospace_workspace_change \
        --set space."$sid" \
        background.color=0x44ffffff \
        background.corner_radius=5 \
        background.height=20 \
        background.drawing=off \
        label.font.size=14.0 \
        label.color="$LAVENDER" \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$PLUGIN_DIR/aerospace.sh $sid"
done
    sketchybar --add space "space.$sid" center \
               --set "space.$sid" "${space[@]}" \
  update_freq=60
  updates=on
