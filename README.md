# dotfiles

Personal dotfiles, organized **one folder per machine** — each machine's configuration is
self-contained and may differ completely from the others. There is no shared/common base beyond
what's in `base/`.

## Layout

- **`base/`** — the original baseline config (i3, zsh, urxvt, emacs, pacman package lists,
  wallpapers). Predates the per-machine split; kept as a reference starting point, not actively
  deployed anywhere currently.
- **`x200/`** — ThinkPad X200 config (i3-gaps/Dracula, zsh/oh-my-zsh/powerlevel10k, emacs, urxvt,
  rofi, dunst, qt5ct/qt6ct, full dev-tools/Xorg package list).
- **`x220/`** — ThinkPad X220 config. Same general shape as `x200/`, diverged independently.
- **`macbook12/`** — MacBook (Retina, 12") config, based on `x220/` with HiDPI font sizing and
  `libinput-gestures` added for the trackpad.

Each folder is **self-contained**: it has its own `install.sh`, `pacman/packages-list.txt` and
`pacman/aur-packages-list.txt`, and config files. To deploy one, clone the whole repo and run that
machine's own `install.sh` from inside its folder:

```sh
cd dotfiles/x220
sh ./install.sh
```

The script symlinks everything relative to its own location, so it must be run from inside the
correct machine folder — running `x220/install.sh` from the repo root (or any other folder) will
create wrong/broken symlinks.

## History note

Each machine's folder was originally its own git branch (`x200`, `x220`, `macbook12`); they were
folded into this single-branch, per-folder layout on 2026-10-22 via `git subtree`, which preserves
each folder's full original commit history (`git log -- x220/` still shows every commit from when
it was its own branch).
