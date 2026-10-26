#!/bin/sh
# i3blocks entry for the power icon; a click launches the rofi power menu.
dir=$(dirname "$0")

if [ -n "$BLOCK_BUTTON" ]; then
    "$dir/powermenu.sh" &
fi

echo "⏻"
