#!/bin/sh
# FreeBSD equivalent of the Linux `ip` version. Interface name confirmed as
# em0 on this unit (ifconfig -a) -- update here if a dock/NIC changes it.
iface=em0

info=$(ifconfig "$iface" 2>/dev/null) || { printf 'E: down\n\n#FF5555\n'; exit 0; }

if echo "$info" | grep -q 'status: active'; then
    ip=$(echo "$info" | awk '/inet /{print $2}')
    printf 'E: %s\n\n#50FA7B\n' "${ip:-...}"
else
    printf 'E: down\n\n#FF5555\n'
fi
