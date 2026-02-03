#!/bin/sh
set -e

output=$(niri msg -j outputs | jq -r '
  to_entries
  | map(select(.value.logical != null))
  | map({
      name: .key,
      area: (.value.logical.width * .value.logical.height)
    })
  | sort_by(.area)
  | last
  | .name
')

[ -z "$output" ] && exit 1

if [ "$1" = "waybar" ]; then
  config="/tmp/waybar.jsonc"
  sed "s/!REPLACEME/$output/" $HOME/.config/waybar/config.jsonc > $config
  pkill waybar 2>/dev/null || true
  waybar -c "$config" &
fi

if [ "$1" = "hyprlock" ]; then
  config="/tmp/hyprlock.conf"
  sed "s/monitor = /monitor = $output/" $HOME/.config/hypr/hyprlock.conf > $config
  hyprlock -c "$config"
fi
