(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(load-theme 'dracula t)
(custom-set-variables '(initial-frame-alist (quote ((fullscreen . maximized)))))
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
