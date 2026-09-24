#!/bin/sh

export PWD=$(pwd) 
mkdir -p ~/.emacs.d ~/.config/i3 ~/.config/rofi ~/.config/dunst ~/.config/gtk-3.0 ~/.config/gtk-4.0
ln -s $PWD/emacs/init.el ~/.emacs.d/init.el
ln -s $PWD/i3/xinitrc ~/.xinitrc
ln -s $PWD/i3/config ~/.config/i3/config
ln -s $PWD/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
ln -s $PWD/i3/scripts ~/.config/i3/scripts
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
mkdir -p ~/.config/tmux
ln -s $PWD/tmux/tmux.conf ~/.config/tmux/tmux.conf
mkdir -p ~/.config/bat ~/.config/btop ~/.config/lsd ~/.config/broot ~/.config/cava ~/.config/neofetch ~/.config/ranger/colorschemes
ln -s $PWD/bat/config ~/.config/bat/config
ln -s $PWD/btop/btop.conf ~/.config/btop/btop.conf
ln -s $PWD/lsd/config.yaml ~/.config/lsd/config.yaml
ln -s $PWD/lsd/colors.yaml ~/.config/lsd/colors.yaml
ln -s $PWD/broot/conf.hjson ~/.config/broot/conf.hjson
ln -s $PWD/cava/config ~/.config/cava/config
ln -s $PWD/neofetch/config.conf ~/.config/neofetch/config.conf
ln -s $PWD/ranger/rc.conf ~/.config/ranger/rc.conf
ln -s $PWD/ranger/colorschemes/dracula.py ~/.config/ranger/colorschemes/dracula.py
git config --global --add include.path $PWD/git/dracula.gitconfig
mkdir -p ~/.config/spotify-player
ln -s $PWD/spotify-player/app.toml ~/.config/spotify-player/app.toml
ln -s $PWD/spotify-player/theme.toml ~/.config/spotify-player/theme.toml
# VS Code (Code - OSS and VSCodium) settings, per profile; rerun after creating profiles.
python3 $PWD/vscode/link.py
# Firefox: install and activate the Dracula theme via an enterprise policy.
sudo install -Dm644 $PWD/firefox/policies.json /etc/firefox/policies/policies.json
# Dracula GRUB theme (https://github.com/dracula/grub). Assumes GRUB is already
# installed and current (grub-install), as it is right after an Arch install.
grubtheme=$(mktemp -d)
git clone https://github.com/dracula/grub.git "$grubtheme"
sudo cp -r "$grubtheme/dracula" /boot/grub/themes/dracula
sudo sed -i 's|^#GRUB_THEME=.*|GRUB_THEME="/boot/grub/themes/dracula/theme.txt"|' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
