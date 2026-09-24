# dotfiles

Arch Linux + i3 setup for a ThinkPad X220 (this is the `x220` branch).

Everything uses the [Dracula](https://draculatheme.com) theme and the
**MesloLGS NF** font at **10pt** (a Nerd Font, needed for the Powerlevel10k
prompt icons), so the terminal, editors, window manager, menus and
notifications all match.

## Install

1. Install the packages. The AUR list needs [yay](https://github.com/Jguer/yay),
   which has to be bootstrapped by hand the first time (see its README):

   ```sh
   sudo pacman -S --needed - < pacman/packages-list.txt
   yay -S --needed - < pacman/aur-packages-list.txt
   ```

2. From the repo root, run the installer. It symlinks the configs into place,
   sets the GTK/GNOME dark preference, links the VS Code settings, and installs
   the Dracula GRUB theme (the last part asks for your sudo password):

   ```sh
   ./install.sh
   ```

3. Do the manual steps below, then log out and back in (`startx`) so X, i3 and
   the Qt theme variable pick everything up.

### Manual steps

These aren't automated (yet):

- **Browser/app themes** (installed from inside each app, not config files):
  - Brave/Chrome: [Dracula Chrome Theme](https://chromewebstore.google.com/detail/dracula-chrome-theme/gfapcejdoghpoidkfodoiiffaaibpaem)
  - Slack: Preferences → Themes → Dark → Custom theme → Import
    `#282A36, #44475A, #50FA7B, #FF5555`
- **Spotify (optional):** see [Spotify](#spotify) below.

## What's here

| Directory | What | Installed to |
|---|---|---|
| `emacs/` | Emacs config: Dracula, MesloLGS NF 10pt, no startup screen, CIDER, [claude-code-ide](https://github.com/manzaltu/claude-code-ide.el) with `eat` (`C-c C-'`). Packages install themselves on first start (`use-package :ensure`). | `~/.emacs.d/init.el` |
| `urxvt/` | `Xresources`: Dracula palette, MesloLGS NF 10 with Noto Sans Symbols 2 fallback, `letterSpace: -1` so text matches Emacs | `~/.Xresources` |
| `zsh/` | `zshrc`, Powerlevel10k (`p10k.zsh`), Dracula syntax highlighting, autosuggestions, `ls`/`grep`/`jq`/man-page colors (`dracula.dircolors`) | `~/.zshrc`, `~/.p10k.zsh` |
| `i3/` | i3 config (Dracula window borders and bar, MesloLGS NF 10), `xinitrc`, i3blocks status bar and scripts (volume, battery, network, power menu, lock screen) | `~/.config/i3/`, `~/.xinitrc` |
| `rofi/` | Dracula launcher (`$mod+d`) and power menu (`$mod+Shift+p`) | `~/.config/rofi/config.rasi` |
| `dunst/` | Dracula notifications (grey/purple/red frames by urgency) | `~/.config/dunst/dunstrc` |
| `gtk/` | GTK 2/3/4 settings for the Dracula GTK theme (`dracula-gtk-theme` from the AUR) | `~/.config/gtk-*`, `~/.gtkrc-2.0` |
| `qt/` | qt5ct/qt6ct config: Fusion style + a Dracula color scheme (Qt apps via `QT_QPA_PLATFORMTHEME=qt5ct` in `xinitrc`) | `~/.config/qt5ct/`, `~/.config/qt6ct/` |
| `tmux/` | Dracula status bar, pane borders and copy-mode colors; 24-bit color for urxvt | `~/.config/tmux/tmux.conf` |
| `qutebrowser/` | Loads the official Dracula theme (cloned by `install.sh`), MesloLGS NF 10, dark websites | `~/.config/qutebrowser/config.py` |
| `vscode/` | Code - OSS and VSCodium settings, per profile: Dracula Theme, MesloLGS NF 13px for editor and terminal | see [VS Code](#vs-code) |
| `spotify-player/` | Dracula theme for the terminal Spotify client, album cover off | `~/.config/spotify-player/` |
| `bat/`, `btop/`, `lsd/`, `broot/`, `cava/`, `neofetch/`, `ranger/` | Dracula themes for each tool | `~/.config/<tool>/` |
| `firefox/` | Enterprise policy that installs and activates the [Dracula Dark Theme](https://addons.mozilla.org/en-US/firefox/addon/dracula-dark-colorscheme/) (not locked: you can still switch or remove it) | `/etc/firefox/policies/policies.json` (sudo) |
| `git/` | Dracula colors for `git diff/status/log/branch`, included from `~/.gitconfig` (which stays out of this public repo) | `git config --global include.path` |
| `wallpapers/` | Wallpapers; the active one is `dracula-galaxy-282a36.png` (set in `xinitrc`) | — |
| `pacman/` | Package lists (`packages-list.txt`, `aur-packages-list.txt`), kept sorted | — |

## Notes

### Linux console (tty1–6)

On the raw console, `zshrc` loads the Dracula palette into the console's 16
colors, and `p10k.zsh` switches the prompt to ASCII with a two-line layout.
The console can only show colors 0–7 (higher ones render as the default color),
so the console prompt only uses those; bold color 0 gives Dracula's grey.

### VS Code

Profile folders have random, machine-specific IDs, so profile settings are
stored by profile **name** (`vscode/<editor>/profiles/<name>.json`).
`vscode/link.py` matches them to the IDs in each editor's profile list and
symlinks them. Profiles that don't exist yet are skipped: create them in the
editor, then rerun `python3 vscode/link.py`. Settings changed in VS Code are
written through the symlinks, so they show up as changes in this repo.

Code - OSS can't verify extension signatures from the command line
("Signature verification failed … UnknownError"); installing a checked
`.vsix` works.

### Spotify

- **spotify-player** (`spotify_player`): terminal client with its own built-in
  player (librespot), so the desktop app isn't needed. Requires Spotify Premium.
  On first start it opens a browser to sign in.
- **Desktop app theme (optional):** [Spicetify](https://spicetify.app)
  (`spicetify-cli` from the AUR) with the Sleek theme's Dracula scheme from
  [spicetify-themes](https://github.com/spicetify/spicetify-themes). Spotify's
  folder must be writable by you first:
  `sudo chown felipe /opt/spotify && sudo chown -R felipe /opt/spotify/Apps`.
  After every Spotify update, redo that and run `spicetify backup apply`;
  `spicetify restore` undoes the theme.

### GRUB

`install.sh` installs the [Dracula GRUB theme](https://github.com/dracula/grub)
and regenerates `grub.cfg`. It assumes GRUB itself is current. If the installed
GRUB is older than the `grub` package, run
`sudo grub-install --target=i386-pc /dev/sda` first (BIOS; check the disk
name), otherwise the new config may not boot.

### Screen lock

`i3/scripts/lock.sh` runs `i3lock` with the Dracula background; `xss-lock`
(started from the i3 config) and the power menu both use it. Stock `i3lock`
can't recolor its unlock ring; that needs `i3lock-color` from the AUR.
