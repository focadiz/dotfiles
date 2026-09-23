#!/bin/sh
iface=enp0s25

if ip link show "$iface" | grep -q "state UP"; then
    ip=$(ip -4 -o addr show "$iface" | awk '{print $4}' | cut -d/ -f1)
    printf 'E: %s\n\n#50FA7B\n' "${ip:-...}"
else
    printf 'E: down\n\n#FF5555\n'
fi
