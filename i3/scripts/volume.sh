#!/bin/sh
# Shared volume control: used by XF86Audio* keybindings and the i3bar
# volume block (i3blocks.conf), so keypresses and bar clicks/scroll
# stay consistent and both trigger the same OSD popup.
sink=@DEFAULT_SINK@
source=@DEFAULT_SOURCE@

case "$1" in
    up) pactl set-sink-volume "$sink" +5% ;;
    down) pactl set-sink-volume "$sink" -5% ;;
    mute) pactl set-sink-mute "$sink" toggle ;;
    micmute) pactl set-source-mute "$source" toggle ;;
esac

vol=$(pactl get-sink-volume "$sink" | grep -m1 -o '[0-9]\+%' | head -1 | tr -d '%')
mute=$(pactl get-sink-mute "$sink" | awk '{print $2}')
micmute=$(pactl get-source-mute "$source" | awk '{print $2}')

if [ "$1" = "micmute" ]; then
    if [ "$micmute" = "yes" ]; then
        notify-send -a volume -r 9994 -u low -h int:value:0 "Microphone" "Muted"
    else
        notify-send -a volume -r 9994 -u low -h int:value:100 "Microphone" "Unmuted"
    fi
elif [ -n "$1" ]; then
    if [ "$mute" = "yes" ]; then
        notify-send -a volume -r 9993 -u low -h int:value:0 "Volume" "Muted"
    else
        notify-send -a volume -r 9993 -u low -h int:value:"$vol" "Volume" "${vol}%"
    fi
fi

pkill -RTMIN+10 i3blocks 2>/dev/null

if [ "$mute" = "yes" ]; then
    printf 'V: mute\n\n#FF0000\n'
else
    printf 'V: %s%%\n\n#00FF00\n' "$vol"
fi
