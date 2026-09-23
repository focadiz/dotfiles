;;; init.el --- Emacs config  -*- lexical-binding: t; -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages '(request jazz-theme dracula-theme cider)))
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(set-face-attribute 'default nil :family "MesloLGS NF" :height 110)
(set-fontset-font t 'symbol "Noto Sans Symbols 2" nil 'append)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Claude Code IDE integration (https://github.com/manzaltu/claude-code-ide.el)
(use-package eat
  :ensure t)

(use-package claude-code-ide
  :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
  :bind ("C-c C-'" . claude-code-ide-menu)
  :custom
  (claude-code-ide-terminal-backend 'eat)
  :config
  (claude-code-ide-emacs-tools-setup))
