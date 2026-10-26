# qutebrowser config. The Dracula theme lives in ./dracula, cloned from
# https://github.com/dracula/qutebrowser by install.sh (not vendored here:
# the upstream repo has no license).
import dracula.draw

# Keep settings made with :set (stored in autoconfig.yml).
config.load_autoconfig()

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

# Match the font used by Emacs, urxvt, i3, rofi and dunst.
c.fonts.default_family = 'MesloLGS NF'
c.fonts.default_size = '10pt'

# Ask websites for their dark version (prefers-color-scheme: dark).
c.colors.webpage.preferred_color_scheme = 'dark'
