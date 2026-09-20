#!/bin/sh
iface=wlp3s0

if nmcli -t -f DEVICE,STATE dev status | grep -q "^${iface}:connected"; then
    ssid=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | awk -F: '$1=="yes"{print $2}')
    signal=$(nmcli -t -f active,signal dev wifi 2>/dev/null | awk -F: '$1=="yes"{print $2}')
    echo "W: ${ssid} ${signal}%"
else
    echo "W: down"
fi
