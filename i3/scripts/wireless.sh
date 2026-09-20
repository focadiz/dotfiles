#!/bin/sh
iface=wlp3s0

if nmcli -t -f DEVICE,STATE dev status | grep -q "^${iface}:connected"; then
    ssid=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | awk -F: '$1=="yes"{print $2}')
    signal=$(nmcli -t -f active,signal dev wifi 2>/dev/null | awk -F: '$1=="yes"{print $2}')
    ip=$(ip -4 -o addr show "$iface" | awk '{print $4}' | cut -d/ -f1)
    echo "W: (${signal}% at ${ssid}) ${ip}"
else
    echo "W: down"
fi
