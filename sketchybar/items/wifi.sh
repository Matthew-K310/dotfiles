#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

wifi=(
	# label
	# "label.color=$FOAM"
	"label.color=$FOAM"

	# background.color="0x80232323"

	# background.color="$WIFI_BACKGROUND"

	# functionality
	update_freq=15
	script="$PLUGIN_DIR/wifi.sh"
)

sketchybar --add item wifi right \
	--set wifi "${wifi[@]}" \
	--subscribe wifi
