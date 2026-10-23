#!/bin/sh
# Lock the screen in Dracula colors. Extra arguments (e.g. --nofork, which
# xss-lock needs) are passed through to i3lock.
#
# With i3lock-color (AUR) the unlock ring and clock are themed too: purple
# ring, pink keypress / red backspace highlights, cyan while verifying, red on
# a wrong password. The stock i3lock only supports the background color.

if pacman -Qqs '^i3lock-color' >/dev/null 2>&1; then
    font="MesloLGS NF"
    exec i3lock --color=282a36ff \
        --indicator --clock --radius=110 --ring-width=8 \
        --inside-color=282a36ff --ring-color=bd93f9ff \
        --insidever-color=282a36ff --ringver-color=8be9fdff \
        --insidewrong-color=282a36ff --ringwrong-color=ff5555ff \
        --line-color=00000000 --separator-color=00000000 \
        --keyhl-color=ff79c6ff --bshl-color=ff5555ff \
        --time-color=f8f8f2ff --date-color=6272a4ff --layout-color=f8f8f2ff \
        --verif-color=8be9fdff --wrong-color=ff5555ff --modif-color=f8f8f2ff \
        --time-str="%H:%M" --date-str="%a %d %b" \
        --time-font="$font" --date-font="$font" --layout-font="$font" \
        --verif-font="$font" --wrong-font="$font" \
        "$@"
fi

exec i3lock --color=282a36 "$@"
