#!/bin/sh
bat=/sys/class/power_supply/BAT0
cap=$(cat "$bat/capacity")
status=$(cat "$bat/status")

if [ "$status" = "Discharging" ] && [ "$cap" -le 15 ]; then
    color=#FF0000
elif [ "$status" = "Discharging" ] && [ "$cap" -le 35 ]; then
    color=#FFFF00
else
    color=#00FF00
fi

printf '%s %s%%\n\n%s\n' "$status" "$cap" "$color"
