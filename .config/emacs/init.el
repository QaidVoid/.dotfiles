;; -*- lexical-binding: t -*-

(setq gc-cons-threshold (* 300 1024 1024))

(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(load "general")
(load "editor-config")
(load "development")

(setq gc-cons-threshold (* 2 1000 1000))
