#!/bin/sh
# Rofi power menu, also launched by the power icon in the i3bar (see i3blocks.conf).
#
# FreeBSD equivalent of the Linux systemctl version. No "Hibernate" here --
# FreeBSD suspend-to-disk is not reliably supported on this hardware, so it's
# left out rather than offering something that would likely fail. doas is
# passwordless for felipe on this unit, so these run straight through.

lock="Lock"
logout="Logout"
suspend="Suspend"
reboot="Reboot"
shutdown="Shutdown"

chosen=$(printf '%s\n%s\n%s\n%s\n%s\n' \
    "$lock" "$logout" "$suspend" "$reboot" "$shutdown" \
    | rofi -dmenu -i -p "Power" -no-custom)

case "$chosen" in
    "$lock") ~/.config/i3/scripts/lock.sh --nofork ;;
    "$logout") i3-msg exit ;;
    "$suspend") doas acpiconf -s 3 ;;
    "$reboot") doas shutdown -r now ;;
    "$shutdown") doas shutdown -p now ;;
esac
