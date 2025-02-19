#!/usr/bin/env bash

SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8")

sketchybar --add event aerospace_workspace_change

for m in $(aerospace list-monitors | awk '{print $1}'); do
  for i in $(aerospace list-workspaces --monitor "$m"); do
    sid=$i

    name_idx=$(( i - 1 ))
    name=${SPACE_ICONS[$name_idx]}

    space=(
      space="$sid"

      display="$m"

      label="$name"
      # label.color="$WHITE"

      background.color="0x44ffffff" \

      background.corner_radius="5" \

      background.height="20" \

      background.drawing="off" \

      label.color="$LAVENDER"

      padding_left=2
      padding_right=2

      # script="$PLUGIN_DIR/space.sh"
      script="$PLUGIN_DIR/aerospace.sh"
    )

    sketchybar --add space "space.$sid" center \
               --set "space.$sid" "${space[@]}" \
               # --subscribe "space.$sid" aerospace_workspace_change
  done

  # for i in $(aerospace list-workspaces --monitor "$m" --empty); do
  #   sketchybar --set "space.$i" "display=0"
  # done
done

space_creator=(
  icon=􀆊
  icon.font="$FONT:Bold:16.0"
  padding_left=0
  padding_right=0
  label.drawing=off
  display=active
  script="$PLUGIN_DIR/space_windows.sh"
  icon.color=$WHITE
)

sketchybar --add item space_creator left               \
           --set space_creator "${space_creator[@]}"   \
           # --subscribe space_creator aerospace_workspace_change
