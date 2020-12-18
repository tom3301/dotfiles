
(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(set-frame-font "Inconsolata 14" nil t)

(menu-bar-mode -1)
(load-theme 'doom-gruvbox t)
(column-number-mode)

(global-display-line-numbers-mode t)


;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Vim keybindings
(use-package evil
  :ensure t)
(evil-mode 1)

(use-package org
  :ensure t)

;;completer for shortcuts
(use-package ivy
  :diminish
  :config
  (ivy-mode 1))
(use-package doom-themes)
;;nice balk at bottom
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" default))
 '(package-selected-packages
   '(yasnippet latex-preview-pane counsel ivy-rich doom-modeline use-package ivy evil-leader command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;Show keybindings when prefix is pressed
(use-package which-key
  :init(which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind ("M-x" . counsel-M-x))
(use-package latex-preview-pane)
(dolist (hook '(Tex-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(use-package yasnippet)
(yas-global-mode 1)
