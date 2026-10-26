#!/bin/sh
# WM-only install for the T420 (FreeBSD). Unlike the Linux machines' install.sh,
# this intentionally does NOT touch zsh/qutebrowser/vscode/brave/firefox/grub/
# spotify-player etc. -- this unit only has the i3 tiling WM stack set up so
# far, not the full desktop/app suite.

export PWD=$(pwd)
mkdir -p ~/.config/i3 ~/.config/rofi ~/.config/dunst
ln -sf "$PWD/i3/xinitrc" ~/.xinitrc
ln -sf "$PWD/i3/config" ~/.config/i3/config
ln -sf "$PWD/i3/i3blocks.conf" ~/.config/i3/i3blocks.conf
ln -sf "$PWD/i3/scripts" ~/.config/i3/scripts
ln -sf "$PWD/urxvt/Xresources" ~/.Xresources
ln -sf "$PWD/rofi/config.rasi" ~/.config/rofi/config.rasi
ln -sf "$PWD/dunst/dunstrc" ~/.config/dunst/dunstrc
