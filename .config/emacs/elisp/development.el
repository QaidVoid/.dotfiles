;; -*- lexical-binding: t -*-

;; Treesitter
(use-package tree-sitter)
(use-package tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

;; Magit
(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(qv/leader-key
  "g" '(:ignore t :wk "git")
  "gs" 'magit-status
  "gd" 'magit-diff-unstaged
  "gc" 'magit-branch-or-checkout
  "gl" '(:ignore t :wk "log")
  "glc" 'magit-log-current
  "glf" 'magit-log-buffer-file
  "gb"  'magit-branch
  "gP"  'magit-push-current
  "gp"  'magit-pull-branch
  "gf"  'magit-fetch
  "gF"  'magit-fetch-all
  "gr"  'magit-rebase)

;; Projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/development")
    (setq projectile-project-search-path '("~/development")))
  (setq projectile-switch-project-action #'projectile-dired))

;; Auto-format
(use-package apheleia
  :config
  (apheleia-global-mode +1))

;; Company for completion
(use-package company
  :hook ((emacs-lisp-mode css-mode) . company-mode)
  :bind (:map company-active-map
              ("<return>" . company-complete-selection)
              ("<backtab>" . company-select-previous)
              ("<tab>" . company-select-next))
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :config
  (setq
    company-dabbrev-downcase nil
    company-backends '((
                      company-files
                      company-keywords
                      company-capf)
                      (company-abbrev company-dabbrev)))

  :custom
  (company-idle-delay 0.3)
  (company-minimum-prefix-length 1)
  (company-tooltip-align-annotations t)
  (company-require-match nil)
  (company-selection-wrap-around t)
  (company-dabbrev-downcase t))

(use-package company-box
  :disabled
  :hook (company-mode . company-box-mode))

;; Language Server Protocol
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook
  ((
    (c-mode c++-mode) . lsp-deferred)
    (lsp-mode . lsp-enable-which-key-integration)
    )
  :custom
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-rust-analyzer-server-display-inlay-hints t)
  (lsp-enable-symbol-highlighting nil)
  (lsp-enable-links t)
  (lsp-enable-folding t)
  (lsp-signature-auto-activate nil))

(use-package lsp-ui
  :disabled
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-code-actions t)
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-doc-position 'bottom)
  (lsp-ui-doc-show))

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(qv/leader-key
  "l" '(:ignore t :wk "lsp")
  "ld" 'lsp-ui-peek-find-definitions
  "lr" 'lsp-ui-peek-find-references
  "li" 'lsp-ui-imenu
  "lc" 'lsp-execute-code-action
  "ln" 'lsp-rename
  "lw" '(:ignore t :wk "workspace")
  "lwr" 'lsp-workspace-restart
  "lws" 'lsp-workspace-shutdown)

;; Dubug Adapter Support
(use-package dap-mode
  :custom
  (lsp-enable-dap-auto-configure nil)
  :config
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (require 'dap-node)
  (dap-node-setup))

;; Typescript/Javascript
(use-package typescript-mode
  :mode "\\.ts\\'"
  :config
  (setq typescript-indent-level 2))

(defun qv/set-js-indentation ()
  (setq js-indent-level 2)
  (setq evil-shift-width js-indent-level)
  (setq-default tab-width 2))

(use-package js2-mode
  :mode "\\.jsx?\\'"
  :config
  ;; Use js2-mode for Node scripts
  (add-to-list 'magic-mode-alist '("#!/usr/bin/env node" . js2-mode))

  ;; Don't use built-in syntax checking
  (setq js2-mode-show-strict-warnings nil)

  ;; Set up proper indentation in JavaScript and JSON files
  (add-hook 'js2-mode-hook #'qv/set-js-indentation)
  (add-hook 'json-mode-hook #'qv/set-js-indentation))

;; Rust
(use-package rustic
  :bind (:map rustic-mode-map
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  (setq rustic-format-on-save t))

;; Python
(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))

;; Lua
(use-package lua-mode)

;; Go
(use-package go-mode
  :commands (go-mode)
  :init
;  (setq gofmt-command "goimports")
;  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'lsp-deferred))

;;(use-package company-go
;;  :after go)

;;(use-package go-eldoc
;;  :config
;;  (add-hook 'go-mode-hook 'go-eldoc-setup))

;; Java
(setq lsp-java-server-install-dir "~/.local/share/jdtls")
(use-package lsp-java
  :config (add-hook 'java-mode-hook 'lsp-deferred))

;(use-package dap-java
;  :after (lsp-java))
