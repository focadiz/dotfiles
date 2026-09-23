#!/bin/sh

export PWD=$(pwd) 
ln -s $PWD/i3/xinitrc ~/.xinitrc
ln -s $PWD/i3/config ~/.config/i3/config
ln -s $PWD/urxvt/Xresources ~/.Xresources
ln -s $PWD/zsh/zshrc ~/.zshrc
ln -s $PWD/zsh/p10k.zsh ~/.p10k.zsh
ln -s $PWD/rofi/config.rasi ~/.config/rofi/config.rasi
ln -s $PWD/dunst/dunstrc ~/.config/dunst/dunstrc
sudo ln -s $PWD/wallpapers/wallpaper-1.png /usr/share/backgrounds/archlinux/wallpaper-1.png
