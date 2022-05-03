;; -*- lexical-binding: t -*-

;; Provide user information
(setq user-full-name "Rabindra Dhakal"
      user-mail-address "qaidvoid@gmail.com")

;; Bootstrap straight.el package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Setup evil mode
(defun qv/evil-hook ()
  (dolist (mode '(custom-mode
                  eshell-mode
                  git-rebase-mode
                  term-mode))
    (add-to-list 'evil-emacs-state-modes mode)))

(use-package evil
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-i-jump nil
        evil-respect-visual-line-mode t
        evil-undo-system 'undo-redo)
  :config
  (add-hook 'evil-mode-hook 'qv/evil-hook)
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

;; Use general for keybinding using leader key
(use-package general
	     :config
	     (general-evil-setup t)

	     (general-create-definer qv/leader-key
				     :keymaps '(normal insert visual emacs)
				     :prefix "SPC"
				     :global-prefix "C-SPC"))

;; which-key
(use-package which-key
	     :init (which-key-mode)
	     :diminish (which-key-mode)
	     :custom
	     which-key-idle-delay 0)

;; Disable auto-save & backup
(setq
 auto-save-default nil
 make-backup-files nil)

;; Clean UI
(setq
 inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

;; Confirm with Y/N
(defalias 'yes-or-no-p 'y-or-n-p)

;; Smooth scrolling
(setq
 mouse-wheel-scroll-amount '(1 ((shift) . 1))
 mouse-wheel-progressive-speed nil
 mouse-wheel-follow-mouse 't
 scroll-step 1)

;; Icons
;; Execute all-the-icons-install-fonts to install it to the system
(use-package all-the-icons)

;; Theme
(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-tokyo-night t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
