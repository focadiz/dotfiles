#!/bin/sh
# First battery, if any. With none (e.g. running on AC only), print an empty
# line so i3blocks hides the block.
bat=$(ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -1)
[ -n "$bat" ] || { echo; exit 0; }
cap=$(cat "$bat/capacity")
status=$(cat "$bat/status")

if [ "$status" = "Discharging" ] && [ "$cap" -le 15 ]; then
    color=#FF5555
elif [ "$status" = "Discharging" ] && [ "$cap" -le 35 ]; then
    color=#F1FA8C
else
    color=#50FA7B
fi

printf '%s %s%%\n\n%s\n' "$status" "$cap" "$color"
