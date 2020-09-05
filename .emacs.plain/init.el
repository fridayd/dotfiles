;;;; init.el

(setq inhibit-startup-message t)

(fset 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode -1)   ; disable the menu-bar
(tool-bar-mode -1)   ; disable the tool-bar
(scroll-bar-mode -1) ; disable the scroll-bar
(line-number-mode)   ; show line numbers in the modeline
(column-number-mode) ; show column numbers in the modeline

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'focus-out-hook 'garbage-collect)

;;; macOS
(setq ns-use-native-fullscreen 1)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

;;; customizations
(setq custom-file "~/.emacs.plain/custom-file.el")
(load-file custom-file)

;; package
(require 'package)
;(setq package-enable-at-startup nil) ; start-up time-saver?
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

;; Key Bindings
(use-package general) ; the 'use-package' of key bindings

;; VI-style modal-editing
;; TODO: add leader key(s)?
(use-package evil
   :init
   (setq evil-disable-insert-state-bindings t)
   (evil-mode 1))

;; Search
(use-package ctrlf :config (ctrlf-mode +1))

;; Completion
(use-package company
  :config
  (setq company-idle-delay 0.0)
  (global-company-mode t))

;; show key bindings
(use-package which-key :init (which-key-mode))

;; Modal command menus
(use-package hydra)

;; incremental narrowing
(use-package selectrum :config (selectrum-mode +1))

;; completion candidate sorting and filtering
(use-package prescient :config (prescient-persist-mode))
(use-package company-prescient :config (company-prescient-mode))
(use-package selectrum-prescient :config (selectrum-prescient-mode))

;; GIT
(use-package magit :commands magit-status)

;; Highlight Changes
(use-package diff-hl :config (global-diff-hl-mode))

;; Fountain
(use-package fountain-mode)

;; Dictionary
;(use-package osx-dictionary)

;;; mode-line
;(use-package doom-modeline :init (doom-modeline-mode 1))

;; Lifted from https://github.com/gonsie/dotfiles/blob/master/emacs/theme.el
(setq-default mode-line-format
              (list
	       ;; version-control branch
                 '(:eval (propertize (substring vc-mode 5)
                                   'face 'font-lock-comment-face))

               ;; the buffer name; the file name as a tool tip
               '(:eval (propertize " %b "
                                   'face
                                   (let ((face (buffer-modified-p)))
                                     (if face 'font-lock-warning-face
                                       'font-lock-type-face))
                                   'help-echo (buffer-file-name)))

               ;; line and column
               " (" ;; '%02' to set to 2 chars at least; prevents flickering
               (propertize "%02l" 'face 'font-lock-keyword-face) ","
               (propertize "%02c" 'face 'font-lock-keyword-face)
               ") "

               ;; relative position, size of file
               " ["
               (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
               "/"
               (propertize "%I" 'face 'font-lock-constant-face) ;; size
               "] "

               ;; spaces to align right
               '(:eval (propertize
                " " 'display
                `((space :align-to (- (+ right right-fringe right-margin)
                                      ,(+ 3 (string-width mode-name)))))))

               ;; the current major mode
               (propertize " %m " 'face 'font-lock-string-face)
               ))

(set-face-attribute 'mode-line nil
                    :background "#353644"
                    :foreground "white"
                    :box '(:line-width 8 :color "#353644")
                    :overline nil
                    :underline nil)

(set-face-attribute 'mode-line-inactive nil
                    :background "#565063"
                    :foreground "white"
                    :box '(:line-width 8 :color "#565063")
                    :overline nil
                    :underline nil)

;;; themes
(use-package tao-theme)
(use-package color-theme-sanityinc-tomorrow)
(use-package color-theme-sanityinc-solarized)
(use-package ayu-theme)
;(load-theme 'sanityinc-solarized-light)
(load-theme 'ayu-dark)
