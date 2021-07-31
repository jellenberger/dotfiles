;; set user info

(setq user-full-name "Jim Ellenberger"
      user-mail-address "jim.ellenberger@gmail.com")


;; increase memory thresholds

(setq gc-cons-threshold 50000000)
(setq large-file-warning-threshold 100000000)


;; prefer utf-8

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


;; set up packages

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))(add-hook 'cider-repl-mode-hook #'subword-mode)
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook #'aggressive-indent-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)


;; load theme

(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))


;; clean up some visual clutter

;;(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
;;(blink-cursor-mode -1)


;; add some visual helpers

(show-paren-mode +1)
(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)


;; set editing stuff

(setq-default indent-tabs-mode nil)


;; turn off startup screen

(setq inhibit-startup-screen t)


;; show file path in title bar

(setq frame-title-format
      '((:eval (if (buffer-file-name)
       (abbreviate-file-name (buffer-file-name))
       "%b"))))


;; set margins that trigger scroll to zero and
;; preserve screen position when jumping around

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)


;; relocate backup files to temporary file directory

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; replace "yes" "no" prompts with  "y" and "n"

(fset 'yes-or-no-p 'y-or-n-p)


;; auto reload files changed outside emacs

(global-auto-revert-mode t)


;; auto cleanup whitespace

(add-hook 'before-save-hook 'whitespace-cleanup)


;; undo tree

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))


;; ivy

(use-package ivy
  :ensure t
  :config
  (require 'ivy)
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d "))


;; smex

(use-package smex
  :ensure t
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))


;; exec-path-from-shell

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))


;; company

(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-idle-delay nil)
  (global-set-key (kbd "M-TAB") #'company-complete)
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common))


;; which key

(use-package which-key
  :ensure t
  :config
  (which-key-mode))


;; aggressive indent

(use-package aggressive-indent
  :ensure t)


;; smartparens

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config))


;; rainbow delimeters

(use-package rainbow-delimiters
  :ensure t)


;; clojure mode

(use-package clojure-mode
  :ensure t
  :config
  (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
  (add-hook 'clojure-mode-hook #'aggressive-indent-mode))

(use-package clojure-mode-extra-font-locking
  :ensure t
  :config
  (require 'clojure-mode-extra-font-locking))


;; cider

(use-package cider
  :ensure t
  :config
  (add-hook 'cider-repl-mode-hook #'subword-mode)
  (add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
  (add-hook 'cider-repl-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'cider-repl-mode-hook #'aggressive-indent-mode)
  (add-hook 'cider-repl-mode-hook #'company-mode)
  (add-hook 'cider-mode-hook #'company-mode))










;; don't touch

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (clojure-mode zenburn-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
