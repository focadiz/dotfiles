#!/bin/sh
# FreeBSD equivalent of the Linux /sys/class/net + nmcli version: there is no
# NetworkManager here, so read ifconfig(8) directly. Interface name confirmed
# as wlan0 on this unit (ifconfig -a).
iface=wlan0

info=$(ifconfig "$iface" 2>/dev/null) || { printf 'W: down\n\n#FF5555\n'; exit 0; }

if echo "$info" | grep -q 'status: associated'; then
    ssid=$(echo "$info" | awk -F'ssid ' '/ssid/{print $2}' | awk '{print $1}')
    printf 'W: %s\n\n#50FA7B\n' "$ssid"
else
    printf 'W: down\n\n#FF5555\n'
fi
