#!/bin/sh
# i3blocks entry: reacts to click (mute) and scroll (volume up/down),
# and to periodic refresh (no BLOCK_BUTTON) via volume.sh's own status line.
dir=$(dirname "$0")

case "$BLOCK_BUTTON" in
    1) "$dir/volume.sh" mute ;;
    4) "$dir/volume.sh" up ;;
    5) "$dir/volume.sh" down ;;
    *) "$dir/volume.sh" ;;
esac
