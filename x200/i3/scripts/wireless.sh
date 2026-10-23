#!/bin/sh
# First wireless interface (wlp3s0 on the X220, wls1 on the X200).
iface=$(for i in /sys/class/net/*; do [ -d "$i/wireless" ] && basename "$i" && break; done)

if nmcli -t -f DEVICE,STATE dev status | grep -q "^${iface}:connected"; then
    ssid=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | awk -F: '$1=="yes"{print $2}')
    signal=$(nmcli -t -f active,signal dev wifi 2>/dev/null | awk -F: '$1=="yes"{print $2}')
    printf 'W: %s %s%%\n\n#50FA7B\n' "$ssid" "$signal"
else
    printf 'W: down\n\n#FF5555\n'
fi
