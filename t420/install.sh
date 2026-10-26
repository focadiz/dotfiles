#!/bin/sh
# T420 (FreeBSD) install. Ports most of the X200's CLI/dev-tool/shell stack
# plus the GUI apps that actually exist on FreeBSD (Firefox, qutebrowser,
# Qt/GTK theming). Deliberately NOT ported: VSCode/VSCodium, Brave, Spotify
# desktop, Slack, the Grok tools -- none have a FreeBSD build. NetworkManager
# and Docker are also skipped -- this box uses plain wpa_supplicant/rc.conf
# for networking, and there's no usable native Docker daemon on FreeBSD.
# See t420/packages-list.txt for the exact `pkg install` package set.

export PWD=$(pwd)
mkdir -p ~/.config/i3 ~/.config/rofi ~/.config/dunst ~/.config/tmux ~/.config/bat \
  ~/.config/btop ~/.config/lsd ~/.config/broot ~/.config/cava ~/.config/neofetch \
  ~/.config/ranger/colorschemes ~/.config/qt5ct/colors ~/.config/qt6ct/colors \
  ~/.config/gtk-3.0 ~/.config/gtk-4.0 ~/.config/qutebrowser ~/.emacs.d

ln -sf "$PWD/i3/xinitrc" ~/.xinitrc
ln -sf "$PWD/i3/config" ~/.config/i3/config
ln -sf "$PWD/i3/i3blocks.conf" ~/.config/i3/i3blocks.conf
ln -sf "$PWD/i3/scripts" ~/.config/i3/scripts
ln -sf "$PWD/urxvt/Xresources" ~/.Xresources
ln -sf "$PWD/rofi/config.rasi" ~/.config/rofi/config.rasi
ln -sf "$PWD/dunst/dunstrc" ~/.config/dunst/dunstrc

ln -sf "$PWD/zsh/zshrc" ~/.zshrc
ln -sf "$PWD/zsh/p10k.zsh" ~/.p10k.zsh
ln -sf "$PWD/tmux/tmux.conf" ~/.config/tmux/tmux.conf
ln -sf "$PWD/bat/config" ~/.config/bat/config
ln -sf "$PWD/btop/btop.conf" ~/.config/btop/btop.conf
ln -sf "$PWD/lsd/config.yaml" ~/.config/lsd/config.yaml
ln -sf "$PWD/lsd/colors.yaml" ~/.config/lsd/colors.yaml
ln -sf "$PWD/broot/conf.hjson" ~/.config/broot/conf.hjson
ln -sf "$PWD/cava/config" ~/.config/cava/config
ln -sf "$PWD/neofetch/config.conf" ~/.config/neofetch/config.conf
ln -sf "$PWD/ranger/rc.conf" ~/.config/ranger/rc.conf
ln -sf "$PWD/ranger/colorschemes/dracula.py" ~/.config/ranger/colorschemes/dracula.py
git config --global --add include.path "$PWD/git/dracula.gitconfig"

ln -sf "$PWD/emacs/init.el" ~/.emacs.d/init.el
ln -sf "$PWD/emacs/load-settings.el" ~/.emacs.d/load-settings.el

ln -sf "$PWD/qt/qt5ct.conf" ~/.config/qt5ct/qt5ct.conf
ln -sf "$PWD/qt/qt6ct.conf" ~/.config/qt6ct/qt6ct.conf
ln -sf "$PWD/qt/Dracula.conf" ~/.config/qt5ct/colors/Dracula.conf
ln -sf "$PWD/qt/Dracula.conf" ~/.config/qt6ct/colors/Dracula.conf
ln -sf "$PWD/gtk/gtk-3.0/settings.ini" ~/.config/gtk-3.0/settings.ini
ln -sf "$PWD/gtk/gtk-4.0/settings.ini" ~/.config/gtk-4.0/settings.ini
ln -sf "$PWD/gtk/gtkrc-2.0" ~/.gtkrc-2.0

ln -sf "$PWD/qutebrowser/config.py" ~/.config/qutebrowser/config.py
[ -d ~/.config/qutebrowser/dracula ] || git clone https://github.com/dracula/qutebrowser.git ~/.config/qutebrowser/dracula

# Firefox enterprise policy path on FreeBSD differs from Linux's /etc/firefox/
# -- it lives under the port's own install prefix. Verify the exact path
# (check `pkg info -l firefox | grep distribution`) before relying on this.
doas mkdir -p /usr/local/lib/firefox/distribution
doas install -m 644 "$PWD/firefox/policies.json" /usr/local/lib/firefox/distribution/policies.json

# powerlevel10k and the Dracula GTK theme have no FreeBSD package -- clone
# them directly (idempotent, skipped if already present).
[ -d /usr/local/share/zsh-theme-powerlevel10k ] || \
  doas git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /usr/local/share/zsh-theme-powerlevel10k
[ -d /usr/local/share/themes/Dracula ] || \
  doas git clone --depth=1 https://github.com/dracula/gtk.git /usr/local/share/themes/Dracula

gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme Dracula
