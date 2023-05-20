;;; init.el --- emacs init file -*- lexical-binding: t; -*-

;;; Commentary:

;; ¯\_(ツ)_/¯

;; Maxim Kim <habamax@gmail.com>

;;; Code:

;;; How long it took this time?
(add-hook 'emacs-startup-hook (lambda () (message "%s" (emacs-init-time))))

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(setq user-full-name "Maxim Kim"
      user-mail-address "habamax@gmail.com"
      send-mail-function 'smtpmail-send-it
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 587)

(if +IS-WINDOWS+
    (let ((fonts '(("JetBrains Mono NL" . "14")
                   ("Dejavu Sans Mono"  . "14")
                   ("Consolas"          . "14"))))
      (cl-dolist (fnt fonts)
        (let ((fnt-name (car fnt))
              (fnt-spec (format "%s-%s" (car fnt) (cdr fnt))))
          (when (find-font (font-spec :name fnt-name))
            (add-to-list 'default-frame-alist `(font . ,fnt-spec))
            (set-face-attribute 'fixed-pitch nil :font fnt-spec)
            (set-face-attribute 'fixed-pitch-serif nil :font fnt-spec)
            (cl-return)))))
  (add-to-list 'default-frame-alist '(font . "Monospace-18")))

(when +IS-WINDOWS+
  (set-language-environment 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8-unix))

(setq default-input-method 'russian-computer)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq ring-bell-function #'ignore)
(setq scroll-error-top-bottom t)
(setq disabled-command-function nil)
(setq suggest-key-bindings t)
(setq-default fill-column 80)
(setq-default display-fill-column-indicator-character ?╎)
(setq-default indent-tabs-mode nil)
(setq-default isearch-lazy-count t)
(setq-default line-number-mode t
              column-number-mode t)
(setq describe-bindings-outline t)
(setq set-mark-command-repeat-pop t)
(setq show-paren-when-point-inside-paren t)
(setq tab-always-indent 'complete)

(setq-default abbrev-mode t)
(quietly-read-abbrev-file (concat user-emacs-directory "abbrevs"))

(when +IS-WINDOWS+
  (setq epa-pinentry-mode 'loopback))

;;; Simple HTML renderer to use default font.
(setq shr-use-fonts nil)
(setq shr-color-visible-luminance-min 78)

;;; ripgrep as grep
(setq grep-command "rg -nS --no-heading "
      grep-use-null-device nil)

;;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(setq vc-follow-symlinks t)

(setq tab-bar-show 1)

(electric-pair-mode t)
(delete-selection-mode t)
(save-place-mode 1)
(savehist-mode 1)
(recentf-mode 1)
(repeat-mode t)
(winner-mode t)

(if (window-system)
    (cd "~/"))

;;; use packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq-default
 package-native-compile t
 use-package-always-ensure t
 use-package-always-defer t
 use-package-enable-imenu-support t)


(require 'use-package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") 'append)

(use-package emacs
  :load-path "lisp"
  :bind
  (("M-;" . habamax/toggle-comment)
   ("M-o" . delete-blank-lines)
   ("M-n" . habamax/move-line-down)
   ("M-p" . habamax/move-line-up)
   ("C-w" . habamax/kill-region)
   ("M-w" . habamax/kill-ring-save)
   ("C-c b" . habamax/next-buffer-like-this)
   ("C-c B" . habamax/previous-buffer-like-this)
   ("C-x C-r" . habamax/recentf-open)
   ([remap list-buffers] . ibuffer)
   ("C-c d" . habamax/duplicate-line)
   ("M-s g" . habamax/grep-current-word)
   ("M-s t" . habamax/grep-todo)
   ("C-c t n" . display-line-numbers-mode)
   ("C-c t SPC" . whitespace-mode)
   ("C-c t s" . flyspell-mode)
   ("C-c t m" . flymake-mode)
   ("C-c t l" . hl-line-mode)
   ("C-c t l" . hl-line-mode)
   ("C-c t f" . display-fill-column-indicator-mode)
   ("C-c t b" . habamax/toggle-bg)
   ("C-c t v" . visible-mode)
   ("<f8>" . window-toggle-side-windows)
   ("C-c w" . winner-undo)
   ("C-c W" . winner-redo)
   ("S-<right>" . windmove-right)
   ("S-<left>" . windmove-left)
   ("S-<up>" . windmove-up)
   ("S-<down>" . windmove-down)
   ("M-<right>" . windmove-swap-states-right)
   ("M-<left>" . windmove-swap-states-left)
   ("M-<up>" . windmove-swap-states-up)
   ("M-<down>" . windmove-swap-states-down)
   ("M-`" . other-frame)
   :repeat-map habamax-other-frame-map
   ("o" . other-frame)
   :repeat-map habamax-winner-map
   ("w" . winner-undo)
   ("W" . winner-redo)
   :repeat-map habamax-duplicate-line-repeat-map
   ("d" . habamax/duplicate-line)
   :repeat-map habamax-buffers-like-this-map
   ("b" . habamax/next-buffer-like-this)
   ("B" . habamax/previous-buffer-like-this))
  :init
  (require 'habamax-windows)
  :config
  (require 'habamax))

(use-package habamax-dev
  :ensure nil
  :commands (habamax-dev/run-c-file
             habamax-dev/run-python-file)
  :init
  (add-hook 'c-mode-hook
            (lambda ()
              (local-set-key [f5] 'habamax-dev/run-c-file)
              (c-set-style "linux")
              (setq-local c-basic-offset 4)
              (c-toggle-comment-style -1)))
  (add-hook 'python-mode-hook
            (lambda () (local-set-key [f5] 'habamax-dev/run-python-file))))

(use-package dired
  :ensure nil
  :bind (:map dired-mode-map
              ("b" . dired-up-directory))
  :hook (dired-mode . dired-hide-details-mode)
  :config
  (setq ls-lisp-dirs-first t)
  (setq dired-listing-switches "-lah --group-directories-first"
        dired-dwim-target t
        dired-hide-details-hide-symlink-targets nil))

(use-package vertico
  :init
  (vertico-mode))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic))
  (setq orderless-matching-styles
        '(orderless-literal orderless-initialism orderless-flex)))

(use-package consult
  :bind (("C-c m" . consult-imenu)
         ("C-c M" . consult-imenu-multi)
         ("C-c C-c f" . consult-focus-lines)
         ("C-c C-c k" . consult-keep-lines)
         ("M-g o" . consult-outline)
         ([remap goto-line] . consult-goto-line)
         ("M-s G" . consult-grep)
         ("M-s r" . consult-ripgrep)
         ("M-y" . consult-yank-pop))
  :config
  (consult-customize
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   :preview-key "M-."))

(use-package org
  :ensure nil
  :commands (todo notes)
  :bind (("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-c l" . org-store-link))
  :config
  (define-key org-mode-map (kbd "C-c C-r") verb-command-map)
  (require 'habamax-org)
  :custom-face
  (org-document-title ((t (:height 1.3))))
  (org-agenda-structure ((t (:height 1.3))))
  (org-agenda-date-today ((t (:height 1.2))))
  (org-agenda-date ((t (:height 1.1))))
  (org-level-1 ((t (:height 1.3))))
  (org-level-2 ((t (:height 1.2))))
  (org-level-3 ((t (:height 1.1)))))

(use-package verb
  :config
  (setq verb-auto-kill-response-buffers t))

(use-package dictionary
  :ensure nil
  :commands dictionary-lookup-definition
  :config
  (setq dictionary-server "dict.org"))

(use-package whitespace
  :ensure nil
  :commands (whitespace-mode)
  :config
  (setq whitespace-style '(face trailing tabs spaces tab-mark space-mark))
  (setq whitespace-display-mappings '((tab-mark 9 [8250 9])
                                      (space-mark 32 [183][46])
                                      (space-mark 160 [164][95]))))

(use-package magit
  :commands (magit-status)
  :bind ("C-x g" . magit-file-dispatch))

(use-package markdown-mode
  :bind (:map markdown-mode-map
              ("M-n" . nil)
              ("M-p" . nil))
  :config
  (setq markdown-fontify-code-blocks-natively t)
  (setq markdown-unordered-list-item-prefix "  - ")
  (setq markdown-asymmetric-header t)
  (setq markdown-command
        "pandoc -s -M fontsize=18pt -M maxwidth=60em --highlight-style tango"))

(use-package erc
  :ensure nil
  :commands erc
  :config
  (require 'habamax-erc))

(use-package erc-hl-nicks
  :after erc
  :config
  (add-hook 'wildcharm-hook 'erc-hl-nicks-refresh-colors))

(use-package webpaste
  :commands (webpaste-paste-buffer webpaste-paste-region))

(use-package rainbow-mode
  :commands (rainbow-mode))

(use-package lorem-ipsum
  :commands (lorem-ipsum-insert-sentences lorem-ipsum-insert-paragraphs))

(use-package xclip
  :init
  (when (and (eq system-type 'gnu/linux) (not (display-graphic-p)))
    (xclip-mode 1)))

(use-package corfu
  :init
  (global-corfu-mode)
  :config
  (when (display-graphic-p)
    (corfu-popupinfo-mode)))

(use-package corfu-terminal
  :if (not (display-graphic-p))
  :after corfu
  :init
  (corfu-terminal-mode t)
  (corfu-echo-mode t))


(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))

(use-package tempel
  :bind (("M-*" . tempel-complete)
         ("M-+" . tempel-insert))
  :init
  (defun templ-setup-capf ()
    (setq completion-at-point-functions
          (cons #'tempel-expand
                completion-at-point-functions)))
  (add-hook 'prog-mode-hook 'templ-setup-capf)
  (add-hook 'text-mode-hook 'templ-setup-capf))

(use-package rainbow-delimiters
  :commands rainbow-delimiters-mode
  :init
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode))

(use-package eglot
  :commands eglot)

(use-package gdscript-mode
  :custom
  (gdscript-eglot-version 3))

(use-package sly
  :config
  (setq-default sly-symbol-completion-mode nil))

(use-package zig-mode)

(use-package notmuch
  :ensure nil
  :if (executable-find "notmuch")
  :commands (notmuch notmuch-sync)
  :config
  (require 'habamax-notmuch))

(use-package emms
  :commands (emms emms-add-directory-tree)
  :config
  (emms-all)
  (setq emms-player-list '(emms-player-mpv emms-player-vlc)
        emms-info-functions '(emms-info-native))
  (setq emms-source-file-default-directory "~/Music/"))

(use-package elfeed
  :config
  (let* ((feed-dir (or (getenv "DOCS") "~/docs"))
         (feeds (concat feed-dir "/emacs/elfeeds.el")))
    (when (file-exists-p feeds)
      (load feeds))))


;;; init.el ends here
