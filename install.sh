#!/bin/sh

export PWD=$(pwd) 
ln -s $PWD/i3/xinitrc ~/.xinitrc
ln -s $PWD/i3/config ~/.config/i3/config
ln -s $PWD/urxvt/Xresources ~/.Xresources
ln -s $PWD/zsh/zshrc ~/.zshrc
ln -s $PWD/zsh/p10k.zsh ~/.p10k.zsh
ln -s $PWD/rofi/config.rasi ~/.config/rofi/config.rasi
ln -s $PWD/dunst/dunstrc ~/.config/dunst/dunstrc
ln -s $PWD/gtk/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
ln -s $PWD/gtk/gtk-4.0/settings.ini ~/.config/gtk-4.0/settings.ini
ln -s $PWD/gtk/gtkrc-2.0 ~/.gtkrc-2.0
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Dracula
mkdir -p ~/.config/qt5ct/colors ~/.config/qt6ct/colors
ln -s $PWD/qt/qt5ct.conf ~/.config/qt5ct/qt5ct.conf
ln -s $PWD/qt/qt6ct.conf ~/.config/qt6ct/qt6ct.conf
ln -s $PWD/qt/Dracula.conf ~/.config/qt5ct/colors/Dracula.conf
ln -s $PWD/qt/Dracula.conf ~/.config/qt6ct/colors/Dracula.conf
mkdir -p ~/.config/qutebrowser
ln -s $PWD/qutebrowser/config.py ~/.config/qutebrowser/config.py
git clone https://github.com/dracula/qutebrowser.git ~/.config/qutebrowser/dracula
sudo ln -s $PWD/wallpapers/wallpaper-1.png /usr/share/backgrounds/archlinux/wallpaper-1.png
