;; -*- lexical-binding: t -*-

;; Enable line numbers
(column-number-mode)
(setq column-number-indicator-zero-based nil)

(dolist (mode '(text-mode-hook
                 prog-mode-hook
                 conf-mode-hook))
  (add-hook mode (lambda () (setq display-line-numbers 'relative))))

;; Set font
(set-face-attribute 'default nil
                    :font "JetBrains Mono Medium"
                    :height 120)

;; Enable pretty symbols
(when window-system
  (global-prettify-symbols-mode t))

;; Auto revert changed buffers
(setq global-auto-revert-non-file-buffers t)
(global-auto-revert-mode t)

;; Rainbow delimiters
(use-package rainbow-delimiters
             :hook (prog-mode . rainbow-delimiters-mode))

;; Highlight matching parens
(use-package paren
             :config
             (set-face-attribute 'show-paren-match-expression nil :background "#363e4a")
             (show-paren-mode 1))

;; Set default tab-width and expand tab
(setq-default tab-width 2)
(setq-default evil-shift-width tab-width)

;; Use spaces for indentation
(setq-default indent-tabs-mode nil)

;; Commenting Lines
(use-package evil-nerd-commenter
             :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; Automatically clean whitespaces
(use-package ws-butler
             :hook ((text-mode . ws-butler-mode)
                    (prog-mode . ws-butler-mode)))
;; Modeline
(setq display-time-format "%k:%M %b %y")
(use-package doom-modeline
             :init (doom-modeline-mode 1)
             :custom
             (doom-modeline-height 15)
             (doom-modeline-lsp t))
