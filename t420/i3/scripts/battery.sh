#!/bin/sh
# FreeBSD equivalent of the Linux /sys/class/power_supply version: battery
# state comes from acpiconf(8) here, not /sys. With no battery at all (e.g.
# a desktop-only box), print an empty line so i3blocks hides the block.
out=$(acpiconf -i 0 2>/dev/null) || { echo; exit 0; }
cap=$(echo "$out" | awk -F'[\t ]+' '/^Remaining capacity:/{gsub("%","",$3); print $3}')
status=$(echo "$out" | awk -F'[\t ]+' '/^State:/{print $2}')

if [ "$status" = "discharging" ] && [ "$cap" -le 15 ]; then
    color=#FF5555
elif [ "$status" = "discharging" ] && [ "$cap" -le 35 ]; then
    color=#F1FA8C
else
    color=#50FA7B
fi

printf '%s %s%%\n\n%s\n' "$status" "$cap" "$color"
