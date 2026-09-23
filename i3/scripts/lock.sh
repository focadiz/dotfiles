#!/bin/sh
# Lock the screen with the Dracula background. Extra arguments (e.g. --nofork,
# which xss-lock needs) are passed through to i3lock.

exec i3lock --color=282a36 "$@"
