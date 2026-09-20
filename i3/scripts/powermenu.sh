#!/bin/sh
# Rofi power menu, also launched by the power icon in the i3bar (see i3blocks.conf).

lock="Lock"
logout="Logout"
suspend="Suspend"
hibernate="Hibernate"
reboot="Reboot"
shutdown="Shutdown"

chosen=$(printf '%s\n%s\n%s\n%s\n%s\n%s\n' \
    "$lock" "$logout" "$suspend" "$hibernate" "$reboot" "$shutdown" \
    | rofi -dmenu -i -p "Power" -no-custom)

case "$chosen" in
    "$lock") i3lock --nofork ;;
    "$logout") i3-msg exit ;;
    "$suspend") systemctl suspend ;;
    "$hibernate") systemctl hibernate ;;
    "$reboot") systemctl reboot ;;
    "$shutdown") systemctl poweroff ;;
esac
