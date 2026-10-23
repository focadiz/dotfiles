#!/bin/sh
bat=/sys/class/power_supply/BAT0
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
