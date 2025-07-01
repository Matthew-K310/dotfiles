#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

calendar=(
	# label
	# label.color="$ROSE"
	label.color="$LAVENDER"
	label.shadow.drawing=off

	# background.color="0x80232323"

	# functionality
	update_freq=1
	script="$PLUGIN_DIR/calendar.sh"
	click_script="open -a 'Control Center'"
)

sketchybar --add item calendar center \
	--set calendar "${calendar[@]}" \
	--subscribe calendar system_woke
