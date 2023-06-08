;;; early-init.el --- emacs early init file -*- lexical-binding: t; -*-
;;; Commentary:
;; Things to be loaded early, e.g. set up theme to prevent unwanted white
;; background turning into dark one.

;;; Code:

;;; disable gc for init
(setq gc-cons-threshold most-positive-fixnum)
(add-hook
 'after-init-hook
 (lambda () (setq gc-cons-threshold 800000)))

(setq inhibit-startup-message t
      inhibit-splash-screen t
      initial-scratch-message nil)

(defconst +IS-OSX+ (eq system-type 'darwin))
(defconst +IS-WINDOWS+ (eq system-type 'windows-nt))

(setq-default load-prefer-newer t)

(setq-default
 default-frame-alist
 '((font . "Monospace-18")
   (fullscreen . maximized)
   (horizontal-scroll-bars . nil)
   (vertical-scroll-bars . nil)
   (menu-bar-lines . 0)
   (tool-bar-lines . 0)))

(add-to-list 'custom-theme-load-path (expand-file-name "themes/" user-emacs-directory))
(load-theme 'wildcharm t)

;;; early-init.el ends here
