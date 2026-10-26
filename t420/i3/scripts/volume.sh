#!/bin/sh
# Shared volume control: used by XF86Audio* keybindings and the i3bar
# volume block (i3blocks.conf), so keypresses and bar clicks/scroll stay
# consistent. Sink volume/mute feedback is the bar's [volume] block; mic
# mute still gets an OSD popup since it has no bar indicator of its own.
#
# Unchanged from the X200/X220 version: pactl talks to PulseAudio, which
# works the same way here once the pulseaudio package is installed and
# running (PulseAudio itself sits on FreeBSD's OSS/sndio layer underneath).
sink=@DEFAULT_SINK@
source=@DEFAULT_SOURCE@

case "$1" in
    up) pactl set-sink-volume "$sink" +5% ;;
    down) pactl set-sink-volume "$sink" -5% ;;
    mute) pactl set-sink-mute "$sink" toggle ;;
    micmute) pactl set-source-mute "$source" toggle ;;
esac
