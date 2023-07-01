;;; wildcharm-light-theme.el --- port of vim-wildcharm colorscheme -*- lexical-binding: t; -*-
;; Author: Maxim Kim <habamax@gmail.com>

;;; Commentary:

;; Light theme with mid-contrast colors.
;; Should look mostly the same in GUI and TUI with 256 colors support.
;; NOTE: it is not exactly the same as in vim.

;;; Code:

(deftheme wildcharm-light "Simple mid-contrast light theme.")

(let ((class256 '((class color) (min-colors 256)))
      (classTTY '((type tty)))
      (fg "#000000")(bg "#ffffff")
      (black "#000000")(darkgrey "#808080")
      (red "#af0000")(bright-red "#d70000")
      (green "#008700")(bright-green "#5faf5f")
      (yellow "#af5f00")(bright-yellow "#d78700")
      (blue "#005faf")(bright-blue "#0087d7")
      (magenta "#870087")(bright-magenta "#af00af")
      (cyan "#005f5f")(bright-cyan "#008787")
      (grey "#d0d0d0")(white "#ffffff")
      (purple "#5f00d7")(comment "#87875f")
      (yellow1 "#875f00")(yellow2 "#af5f00")
      (grey1 "#dadada")(grey2 "#e4e4e4")(grey3 "#eeeeee")
      (non-text "#b2b2b2")
      (match-paren "#ff00af")(match "#ffd7ff")
      (mode-line-active "#d0d0d0")(mode-line-inactive "#e4e4e4")
      (menu "#eeeeee")
      (header-line "#d7d7d7")
      (hl-line "#eeeeee")
      (block "#eeeeee")
      (diff-added-bg "#afd7af")(diff-refine-added-bg "#afd7d7")
      (diff-added-fg "#005f00")
      (diff-removed-bg "#d7afaf")(diff-refine-removed-bg "#d7d7af")
      (diff-removed-fg "#5f0000"))

  (custom-theme-set-faces
   'wildcharm-light

   ;;; standard faces
   `(default
      ((,class256 (:background ,bg :foreground ,fg))))
   `(shadow
     ((,class256 (:foreground ,non-text))))
   `(link
     ((,class256 (:foreground ,blue :underline t))))
   `(link-visited
     ((,class256 (:foreground ,magenta :underline t))))
   `(highlight
     ((,class256 (:background ,blue :foreground ,white))))
   `(region
     ((,class256 (:background ,bg :foreground ,bright-blue :inverse-video t))))
   `(secondary-selection
     ((,class256 (:background ,bg :foreground ,bright-cyan :inverse-video t))))
   `(trailing-whitespace
     ((,class256 (:foreground ,red :weight bold))))
   `(line-number
     ((,class256 (:inherit default :foreground ,non-text))))
   `(line-number-current-line
     ((,class256 (:inherit default :foreground ,yellow :weight bold))))
   `(line-number-major-tick
     ((,class256 (:inherit default :foreground ,darkgrey :weight bold))))
   `(line-number-minor-tick
     ((,class256 (:inherit default :foreground ,darkgrey))))
   `(escape-glyph
     ((,class256 (:foreground ,red))))
   `(homoglyph
     ((,class256 (:inherit 'escape-glyph))))
   `(nobreak-space
     ((,class256 (:foreground ,red :underline t))))
   `(nobreak-hyphen
     ((,class256 (:inherit 'escape-glyph))))
   `(mode-line
     ((,class256 (:background ,mode-line-active :foreground ,fg
                              :box (:line-width 1 :color ,non-text)))))
   `(mode-line-inactive
     ((,class256 (:background ,mode-line-inactive :foreground ,darkgrey
                              :box (:line-width 1 :color ,mode-line-active)))))
   `(mode-line-highlight
     ((,class256 (:background ,bg
                              :box (:line-width 1 :color ,non-text)))))
   `(mode-line-emphasis
     ((,class256 (:weight bold))))
   `(mode-line-buffer-id
     ((,class256 (:weight bold))))
   `(header-line
     ((,class256 (:background ,header-line :foreground ,fg :extend t
                              :box (:line-width 1 :color ,darkgrey)))))
   `(vertical-border
     ((,classTTY (:background ,mode-line-inactive :foreground ,mode-line-inactive))
      (,class256 (:background ,non-text :foreground ,non-text))))
   `(window-divider
     ((t (:foreground ,mode-line-inactive))))
   `(window-divider-first-pixel
     ((t (:foreground ,mode-line-active))))
   `(window-divider-last-pixel
     ((t (:foreground ,mode-line-active))))
   `(minibuffer-prompt
     ((,class256 (:foreground ,yellow :weight bold))))
   `(fringe
     ((t (:foreground ,non-text :background unspecified))))
   ;; -scroll-bar
   `(cursor
     ((t (:background ,fg))))
   ;; -tool-bar
   `(tab-bar
     ((,class256 (:background ,mode-line-inactive :foreground ,darkgrey))))
   `(tab-bar-tab
     ((,class256 (:background ,mode-line-active :foreground ,black :weight bold
                              :box (:line-width 1 :color ,non-text)))))
   `(tab-bar-tab-inactive
     ((t (:background unspecified :foreground ,fg))))
   `(help-key-binding
     ((,class256 (:background unspecified :foreground ,cyan :weight bold))))
   `(error
     ((,class256 (:foreground ,bright-red :weight bold))))
   `(warning
     ((,class256 (:foreground ,yellow :weight bold))))
   `(success
     ((,class256 (:foreground ,green :weight bold))))
   `(menu
     ((t (:background ,mode-line-inactive :foreground ,fg))))
   `(tty-menu-enabled-face
     ((t (:background ,menu :foreground ,fg))))
   `(tty-menu-disabled-face
     ((t (:background ,menu :foreground ,darkgrey))))
   `(tty-menu-selected-face
     ((t (:background ,mode-line-active :foreground ,fg :weight bold))))

   `(show-paren-match
     ((,class256 :foreground ,match-paren :weight bold)))
   `(show-paren-mismatch
     ((,class256 :background ,match-paren :foreground ,black :weight bold)))

   ;;; font-lock
   `(font-lock-string-face
     ((,class256 (:foreground ,green))))
   `(font-lock-comment-face
     ((,class256 (:foreground ,comment))))
   `(font-lock-keyword-face
     ((,class256 (:foreground ,blue))))
   `(font-lock-preprocessor-face
     ((,class256 (:foreground ,purple))))
   `(font-lock-builtin-face
     ((,class256 (:foreground ,magenta))))
   `(font-lock-type-face
     ((,class256 (:foreground ,yellow))))
   `(font-lock-function-name-face
     ((,class256 (:foreground ,magenta))))
   `(font-lock-variable-name-face
     ((,class256 (:foreground ,bright-cyan))))
   `(font-lock-constant-face
     ((,class256 (:foreground ,red))))
   `(font-lock-warning-face
     ((,class256 (:foreground ,bright-yellow :weight bold))))

   ;;; isearch
   `(isearch
     ((,class256 (:background ,white :foreground ,bright-yellow :inverse-video t))))
   `(isearch-group-1
     ((,class256 (:background ,white :foreground ,yellow2 :inverse-video t))))
   `(isearch-group-2
     ((,class256 (:background ,white :foreground ,yellow1 :inverse-video t))))
   `(lazy-highlight
     ((,class256 (:background ,white :foreground ,green :inverse-video t))))
   `(isearch-fail
     ((,class256 (:background ,diff-removed-bg :foreground ,diff-removed-fg))))

   ;;; replace.el
   `(match
     ((,class256 (:background ,match))))

   ;;; global-hl-line-mode
   `(hl-line
     ((,class256 (:background ,hl-line :foreground unspecified))))

   ;;; widget
   `(custom-button
     ((,class256 (:background ,grey1 :foreground ,fg :extend t
                              :box (:line-width (2 . 2) :style released-button)))))
   `(custom-button-pressed
     ((,class256 (:background ,grey1 :foreground ,fg :extend t
                              :box (:line-width (2 . 2) :style pressed-button)))))
   `(custom-button-mouse
     ((,class256 (:background ,hl-line :foreground ,fg :extend t
                              :box (:line-width (2 . 2) :style released-button)))))
   `(widget-field
     ((,class256 (:background ,grey1 :foreground ,fg :extend t))))
   `(widget-inactive
     ((,class256 (:foreground ,darkgrey))))
   `(widget-button-pressed
     ((,class256 (:foreground ,bright-red))))
   `(widget-documentation
     ((,class256 (:foreground ,green))))

   ;;; customize
   `(custom-variable-tag
     ((,class256 (:weight bold))))

   ;;; dired
   `(dired-header
     ((,class256 (:foreground ,fg :weight bold))))
   `(dired-directory
     ((,class256 (:inherit font-lock-keyword-face :weight bold))))
   `(dired-symlink
     ((,class256 (:foreground ,cyan :weight bold :inherit nil))))
   `(dired-broken-symlink
     ((,class256 (:background ,bright-red :foreground ,white))))
   `(dired-special
     ((,class256 (:foreground ,magenta :inherit nil))))
   `(dired-perm-write
     ((,class256 (:foreground ,yellow :inherit nil))))

   ;;; completion
   `(icomplete-first-match
     ((,class256 (:foreground ,green :weight bold))))
   `(icomplete-selected-match
     ((,class256 (:background ,hl-line))))
   `(completions-common-part
     ((,class256 (:foreground ,blue :weight bold))))
   `(completions-first-difference
     ((,class256 (:foreground ,magenta))))
   `(completions-annotations
     ((,class256 (:foreground ,darkgrey))))

   ;;; ido
   `(ido-first-match
     ((,class256 (:foreground ,green :weight bold))))
   `(ido-only-match
     ((,class256 (:inherit 'ido-first-match))))
   `(ido-virtual
     ((,class256 (:foreground ,darkgrey))))
   `(ido-subdir
     ((,class256 (:foreground ,fg :weight bold))))
   ;; check how good it is
   `(ido-indicator
     ((,class256 (:background ,bright-red :foreground ,yellow))))

   ;;; compilation
   `(compilation-mode-line-fail
     ((,class256 (:foreground ,red :weight bold))))
   `(compilation-mode-line-exit
     ((,class256 (:foreground ,green :weight bold))))
   `(compilation-line-number
     ((,class256 (:foreground ,darkgrey))))

   ;;; whitespace
   `(whitespace-space
     ((,class256 (:background unspecified :foreground ,non-text))))
   `(whitespace-line
     ((,class256 nil)))
   `(whitespace-trailing
     ((,class256 (:inherit 'trailing-whitespace))))
   `(whitespace-indentation
     ((,class256 (:inherit 'whitespace-space))))
   `(whitespace-tab
     ((,class256 (:inherit 'whitespace-space))))
   `(whitespace-empty
     ((,class256 (:background ,yellow))))

   ;;; vc
   `(log-view-message
     ((,class256 (:foreground ,darkgrey))))
   `(log-view-commit-body
     ((,class256 (:foreground ,fg))))

   ;;; message
   `(message-header-name
     ((,class256 (:foreground ,magenta))))
   `(message-header-subject
     ((,class256 (:foreground ,black :weight bold))))
   `(message-header-to
     ((,class256 (:foreground ,black))))
   `(message-header-other
     ((,class256 (:foreground ,fg))))
   `(message-header-cc
     ((,class256 (:foreground ,darkgrey))))
   `(message-separator
     ((,class256 (:background ,grey1 :foreground ,fg :extend t))))
   `(message-mml
     ((,class256 (:foreground ,comment))))

   ;;; bookmark
   `(bookmark-face
     ((,class256 (:background unspecified :foreground ,yellow))))

   ;;; info
   `(info-title-4
     ((,class256 (:foreground ,black :weight bold))))
   `(info-menu-header
     ((,class256 (:inherit info-title-3))))
   `(info-node
     ((,class256 (:foreground ,yellow :weight bold))))

   ;;; org
   `(org-meta-line
     ((,class256 (:foreground ,darkgrey))))
   `(org-document-info-keyword
     ((t (:inherit org-meta-line))))
   `(org-special-keyword
     ((t (:inherit org-meta-line))))
   `(org-block-begin-line
     ((t (:inherit org-meta-line))))
   `(org-block-end-line
     ((t (:inherit org-block-begin-line))))
   `(org-document-title
     ((,class256 (:foreground ,black :weight bold))))
   `(org-document-info
     ((,class256 (:foreground ,fg))))
   `(org-drawer
     ((,class256 (:foreground ,purple))))
   `(org-code
     ((,class256 (:foreground ,cyan))))
   `(org-verbatim
     ((,class256 (:foreground ,magenta))))
   `(org-tag
     ((,class256 (:foreground ,darkgrey :weight normal))))
   `(org-block
     ((t (:foreground ,fg))))
   `(org-level-1
     ((,class256 (:foreground ,black :weight bold))))
   `(org-level-2
     ((,class256 (:foreground ,black :weight bold))))
   `(org-level-3
     ((,class256 (:foreground ,black :weight bold))))
   `(org-level-4
     ((,class256 (:foreground ,black :weight bold))))
   `(org-level-5
     ((,class256 (:foreground ,black :weight bold))))
   `(org-level-6
     ((,class256 (:foreground ,black :weight bold))))
   `(org-level-7
     ((,class256 (:foreground ,black :weight bold))))
   `(org-level-8
     ((,class256 (:foreground ,black :weight bold))))
   `(org-todo
     ((,class256 (:foreground ,yellow :weight bold))))
   `(org-done
     ((,class256 (:foreground ,green :weight bold))))
   `(org-date
     ((,class256 (:foreground ,darkgrey))))
   `(org-headline-done
     ((,class256 (:foreground unspecified))))
   `(org-checkbox
     ((,class256 (:foreground ,darkgrey :weight normal))))
   `(org-dispatcher-highlight
     ((,class256 (:foreground ,bright-red :weight bold))))
   `(org-agenda-structure
     ((,class256 (:foreground ,black :weight bold))))
   `(org-agenda-structure-filter
     ((,class256 (:foreground ,bright-red :weight bold))))
   `(org-date-selected
     ((,class256 (:background ,bright-magenta :foreground ,bg))))
   `(org-agenda-date
     ((,class256 (:foreground ,blue :weight normal))))
   `(org-agenda-date-today
     ((,class256 (:foreground ,bright-magenta :weight bold))))
   `(org-agenda-current-time
     ((,class256 (:foreground ,bright-magenta))))
   `(org-agenda-done
     ((,class256 (:foreground ,green))))
   `(org-scheduled-today
     ((,class256 (:foreground ,bright-cyan))))
   `(org-scheduled
     ((,class256 (:foreground ,cyan))))
   `(org-scheduled-previously
     ((,class256 (:foreground ,red))))
   `(org-upcoming-deadline
     ((,class256 (:foreground ,bright-yellow))))
   `(org-imminent-deadline
     ((,class256 (:foreground ,bright-red :weight bold))))
   `(org-time-grid
     ((,class256 (:foreground ,darkgrey :weight normal))))
   `(org-table
     ((,class256 (:foreground ,fg))))

   ;;; gnus
   `(gnus-button
     ((,class256 (:underline t))))
   `(gnus-group-mail-1
     ((,class256 (:foreground ,green :weight bold))))
   `(gnus-group-mail-1-empty
     ((,class256 (:foreground ,green))))
   `(gnus-group-mail-2
     ((,class256 (:foreground ,yellow :weight bold))))
   `(gnus-group-mail-2-empty
     ((,class256 (:foreground ,yellow))))
   `(gnus-group-mail-3
     ((,class256 (:foreground ,fg :weight bold))))
   `(gnus-group-mail-3-empty
     ((,class256 (:foreground ,fg))))
   `(gnus-group-mail-4
     ((,class256 (:foreground ,darkgrey :weight bold))))
   `(gnus-group-mail-4-empty
     ((,class256 (:foreground ,darkgrey))))
   `(gnus-group-mail-5
     ((,class256 (:foreground ,darkgrey :weight bold))))
   `(gnus-group-mail-5-empty
     ((,class256 (:foreground ,darkgrey))))
   `(gnus-group-mail-6
     ((,class256 (:foreground ,darkgrey :weight bold))))
   `(gnus-group-mail-6-empty
     ((,class256 (:foreground ,darkgrey))))
   `(gnus-group-mail-low
     ((,class256 (:foreground ,darkgrey :weight bold))))
   `(gnus-group-mail-low-empty
     ((,class256 (:foreground ,darkgrey))))
   `(gnus-group-news-1
     ((,class256 (:foreground ,green :weight bold))))
   `(gnus-group-news-1-empty
     ((,class256 (:foreground ,green))))
   `(gnus-group-news-2
     ((,class256 (:foreground ,yellow :weight bold))))
   `(gnus-group-news-2-empty
     ((,class256 (:foreground ,yellow))))
   `(gnus-group-news-3
     ((,class256 (:foreground ,fg :weight bold))))
   `(gnus-group-news-3-empty
     ((,class256 (:foreground ,fg))))
   `(gnus-group-news-4
     ((,class256 (:foreground ,darkgrey :weight bold))))
   `(gnus-group-news-4-empty
     ((,class256 (:foreground ,darkgrey))))
   `(gnus-group-news-5
     ((,class256 (:foreground ,darkgrey :weight bold))))
   `(gnus-group-news-5-empty
     ((,class256 (:foreground ,darkgrey))))
   `(gnus-group-news-6
     ((,class256 (:foreground ,darkgrey :weight bold))))
   `(gnus-group-news-6-empty
     ((,class256 (:foreground ,darkgrey))))
   `(gnus-group-news-low
     ((,class256 (:foreground ,darkgrey :weight bold))))
   `(gnus-group-news-low-empty
     ((,class256 (:foreground ,darkgrey))))
   `(gnus-summary-selected
     ((,class256 (:background ,cyan :foreground ,bg :underline nil))))
   `(gnus-summary-normal-unread
     ((,class256 (:foreground ,black :weight bold))))
   `(gnus-summary-normal-read
     ((,class256 (:foreground ,fg))))
   `(gnus-summary-normal-ticked
     ((,class256 (:foreground ,yellow))))
   `(gnus-summary-normal-ancient
     ((,class256 (:foreground ,fg))))
   `(gnus-summary-cancelled
     ((,class256 (:background unspecified :foreground ,red))))
   `(gnus-header-name
     ((,class256 (:foreground ,magenta))))
   `(gnus-header-from
     ((,class256 (:foreground ,fg :weight normal))))
   `(gnus-header-content
     ((,class256 (:foreground ,fg :weight normal :slant normal))))
   `(gnus-header-subject
     ((,class256 (:foreground ,black :weight bold))))
   `(gnus-cite-attribution
     ((,class256 (:foreground ,green :weight bold :slant normal :underline nil))))
   `(gnus-cite-1
     ((,class256 (:foreground ,green))))
   `(gnus-cite-2
     ((,class256 (:foreground ,yellow))))
   `(gnus-cite-3
     ((,class256 (:foreground ,blue))))
   `(gnus-cite-4
     ((,class256 (:foreground ,magenta))))
   `(gnus-cite-5
     ((,class256 (:foreground ,cyan))))
   `(gnus-cite-6
     ((,class256 (:foreground ,bright-green))))
   `(gnus-cite-7
     ((,class256 (:foreground ,bright-yellow))))
   `(gnus-cite-8
     ((,class256 (:foreground ,bright-blue))))
   `(gnus-cite-9
     ((,class256 (:foreground ,bright-magenta))))
   `(gnus-cite-10
     ((,class256 (:foreground ,bright-cyan))))
   `(gnus-cite-11
     ((,class256 (:foreground ,darkgrey))))
   `(mm-uu-extract
     ((,class256 (:background ,block :foreground ,yellow))))

   ;;; shr
   `(shr-h1
     ((,class256 (:foreground ,black :weight bold :height 1.6))))
   `(shr-h2
     ((,class256 (:foreground ,black :weight bold :height 1.4))))
   `(shr-h3
     ((,class256 (:foreground ,black :weight bold :height 1.2))))
   `(shr-h4
     ((,class256 (:foreground ,black :weight bold :height 1.1))))
   `(shr-h5
     ((,class256 (:foreground ,black :weight bold :height 1.0))))
   `(shr-h6
     ((,class256 (:foreground ,black :weight bold :height 1.0))))

   ;;; dictionary
   `(dictionary-word-definition-face
     ((,class256 (:family nil))))
   `(dictionary-reference-face
     ((,class256 (:foreground ,yellow))))

   ;;; markdown
   `(markdown-header-face
     ((,class256 (:foreground ,black :weight bold))))
   `(markdown-header-delimiter-face
     ((,class256 (:foreground ,blue :weight bold))))
   `(markdown-header-rule-face
     ((,class256 (:foreground ,blue :weight bold))))
   `(markdown-code-face
     ((,class256 (:foreground ,fg))))
   `(markdown-list-face
     ((,class256 (:foreground ,yellow))))
   `(markdown-markup-face
     ((,class256 (:foreground ,darkgrey))))
   `(markdown-inline-code-face
     ((,class256 (:foreground ,green))))
   `(markdown-language-keyword-face
     ((,class256 (:foreground ,cyan))))
   `(markdown-gfm-checkbox-face
     ((,class256 (:foreground ,darkgrey))))

   ;;; diff
   `(diff-header
     ((,class256 (:foreground ,blue :weight bold))))
   `(diff-file-header
     ((,class256 (:foreground ,black))))
   `(diff-hunk-header
     ((,class256 (:foreground ,yellow :weight bold))))
   `(diff-added
     ((,class256 (:background ,diff-added-bg :foreground ,diff-added-fg))))
   `(diff-indicator-added
     ((t (:inherit 'diff-added :foreground ,green))))
   `(diff-refine-added
     ((,class256 (:background ,diff-refine-added-bg :foreground ,diff-added-fg))))
   `(diff-removed
     ((,class256 (:background ,diff-removed-bg :foreground ,diff-removed-fg))))
   `(diff-refine-removed
     ((,class256 (:background ,diff-refine-removed-bg :foreground ,diff-removed-fg))))
   `(diff-indicator-removed
     ((t (:inherit 'diff-removed :foreground ,red))))

   ;;; vc
   `(vc-edited-state
     ((,class256 (:foreground ,yellow))))
   `(vc-conflict-state
     ((,class256 (:foreground ,red))))
   `(vc-locally-added-state
     ((,class256 (:foreground ,cyan))))
   `(vc-locked-state
     ((,class256 (:foreground ,blue))))
   `(vc-missing-state
     ((,class256 (:foreground ,magenta))))
   `(vc-needs-update-state
     ((,class256 (:foreground ,green))))
   `(vc-removed-state
     ((,class256 (:foreground ,red))))

   ;;; git-commit
   `(git-commit-summary
     ((,class256 (:foreground ,black :weight bold))))
   `(git-commit-nonempty-second-line
     ((,class256 (:foreground ,red :weight bold))))

   ;;; magit
   `(magit-section-heading
     ((,class256 (:foreground ,yellow :weight bold))))
   `(magit-section-heading-selection
     ((,class256 (:foreground ,bright-yellow))))
   `(magit-section-highlight
     ((,class256 (:background ,hl-line))))
   `(magit-branch-local
     ((,class256 (:foreground ,blue))))
   `(magit-branch-remote
     ((,class256 (:foreground ,green))))
   `(magit-cherry-equivalent
     ((,class256 (:foreground ,magenta))))
   `(magit-cherry-unmatched
     ((,class256 (:foreground ,cyan))))
   `(magit-bisect-bad
     ((,class256 (:foreground ,red))))
   `(magit-bisect-good
     ((,class256 (:foreground ,green))))
   `(magit-bisect-skip
     ((,class256 (:foreground ,yellow))))
   `(magit-diff-hunk-heading
     ((t (:background ,grey1))))
   `(magit-diff-hunk-heading-highlight
     ((t (:background ,grey1 :weight bold))))
   `(magit-diff-context
     ((t (:foreground ,fg))))
   `(magit-diff-context-highlight
     ((t (:background ,grey3))))
   `(magit-diff-added
     ((t (:inherit 'diff-added))))
   `(magit-diff-added-highlight
     ((t (:inherit 'diff-added))))
   `(magit-diff-removed
     ((t (:inherit 'diff-removed))))
   `(magit-diff-removed-highlight
     ((t (:inherit 'diff-removed))))
   `(magit-diff-lines-heading
     ((,class256 (:background ,green :foreground ,black))))
   `(magit-diffstat-added
     ((,class256 (:foreground ,green))))
   `(magit-diffstat-removed
     ((,class256 (:foreground ,red))))
   `(magit-log-author
     ((,class256 (:foreground ,red))))
   `(magit-log-graph
     ((,class256 (:foreground ,darkgrey))))
   `(magit-log-date
     ((,class256 (:foreground ,darkgrey))))

   ;;; smerge
   `(smerge-lower
     ((,class256 (:background ,diff-added-bg))))
   `(smerge-upper
     ((,class256 (:background ,diff-removed-bg))))
   `(smerge-refined-added
     ((t (:background ,green :foreground ,black))))
   `(smerge-refined-removed
     ((t (:background ,red :foreground ,black))))

   ;;; epa
   `(epa-validity-high
     ((,class256 (:foreground ,green :weight bold))))
   `(epa-validity-medium
     ((,class256 (:foreground ,cyan :weight bold))))
   `(epa-validity-low
     ((,class256 (:foreground ,yellow))))
   `(epa-validity-disabled
     ((,class256 (:foreground ,darkgrey))))

   ;;; flyspell
   `(flyspell-incorrect
     ((,classTTY (:inherit error :underline t))
      (t (:underline (:style wave :color ,bright-red)))))
   `(flyspell-duplicate
     ((,classTTY (:inherit warning :underline t))
      (t (:underline (:style wave :color ,bright-yellow)))))

   ;;; flymake
   `(flymake-error
     ((,classTTY (:inherit error :underline t))
      (t (:underline (:style wave :color ,bright-red)))))
   `(flymake-warning
     ((,classTTY (:inherit warning :underline t))
      (t (:underline (:style wave :color ,bright-yellow)))))

   ;;; erc
   `(erc-timestamp-face
     ((,class256 (:foreground ,darkgrey))))
   `(erc-notice-face
     ((,class256 (:foreground ,darkgrey))))
   `(erc-my-nick-face
     ((,class256 (:foreground ,red :weight bold))))
   `(erc-current-nick-face
     ((,class256 (:foreground ,red))))
   `(erc-nick-msg-face
     ((,class256 (:foreground ,yellow))))
   `(erc-input-face
     ((,class256 (:foreground ,green))))
   `(erc-error-face
     ((,class256 (:foreground ,bright-red))))
   `(erc-dangerous-host-face
     ((,class256 (:foreground ,bright-red))))
   `(erc-direct-msg-face
     ((,class256 (:foreground ,yellow))))
   `(erc-button
     ((,class256 (:background unspecified :foreground ,blue :underline t))))
   `(erc-prompt-face
     ((,class256 (:background unspecified :foreground ,black :weight bold))))
   `(erc-action-face
     ((,class256 (:background unspecified :foreground ,comment))))
   `(fg:erc-face0
     ((,class256 (:foreground ,black))))
   `(fg:erc-face1
     ((,class256 (:foreground ,red))))
   `(fg:erc-face2
     ((,class256 (:foreground ,green))))
   `(fg:erc-face3
     ((,class256 (:foreground ,yellow))))
   `(fg:erc-face4
     ((,class256 (:foreground ,blue))))
   `(fg:erc-face5
     ((,class256 (:foreground ,magenta))))
   `(fg:erc-face6
     ((,class256 (:foreground ,cyan))))
   `(fg:erc-face7
     ((,class256 (:foreground ,grey))))
   `(fg:erc-face8
     ((,class256 (:foreground ,darkgrey))))
   `(fg:erc-face9
     ((,class256 (:foreground ,bright-red))))
   `(fg:erc-face10
     ((,class256 (:foreground ,bright-green))))
   `(fg:erc-face11
     ((,class256 (:foreground ,bright-yellow))))
   `(fg:erc-face12
     ((,class256 (:foreground ,bright-blue))))
   `(fg:erc-face13
     ((,class256 (:foreground ,bright-magenta))))
   `(fg:erc-face14
     ((,class256 (:foreground ,bright-cyan))))
   `(fg:erc-face15
     ((,class256 (:foreground ,black))))

   ;;; rcirc
   `(rcirc-server
     ((,class256 (:foreground ,darkgrey))))
   `(rcirc-timestamp
     ((,class256 (:foreground ,darkgrey))))
   `(rcirc-prompt
     ((,class256 (:foreground ,black :weight bold))))
   `(rcirc-url
     ((,class256 (:background unspecified :foreground ,blue :underline t))))
   `(rcirc-my-nick
     ((,class256 (:foreground ,bright-red :weight bold))))
   `(rcirc-nick-in-message
     ((,class256 (:foreground ,bright-red :weight bold))))
   `(rcirc-other-nick
     ((,class256 (:foreground ,blue))))

   ;;; calendar
   `(calendar-month-header
     ((,class256 (:foreground ,black :weight bold))))
   `(calendar-weekday-header
     ((,class256 (:foreground ,blue))))
   `(calendar-weekend-header
     ((,class256 (:foreground ,yellow))))
   `(calendar-today
     ((,class256 (:foreground ,green))))

   ;;; elfeed
   `(elfeed-log-date-face
     ((,class256 (:foreground ,yellow))))
   `(elfeed-log-error-level-face
     ((,class256 (:foreground ,red))))
   `(elfeed-log-warn-level-face
     ((,class256 (:foreground ,yellow))))
   `(elfeed-log-info-level-face
     ((,class256 (:foreground ,blue))))
   `(elfeed-log-debug-level-face
     ((,class256 (:foreground ,magenta))))
   `(elfeed-search-date-face
     ((,class256 (:foreground ,darkgrey))))
   `(elfeed-search-title-face
     ((,class256 (:foreground ,black))))
   `(elfeed-search-unread-title-face
     ((,class256 (:foreground ,black :weight bold))))
   `(elfeed-search-feed-face
     ((,class256 (:foreground ,green))))
   `(elfeed-search-tag-face
     ((,class256 (:foreground ,yellow))))
   `(elfeed-search-unread-count-face
     ((,class256 (:foreground ,blue))))

   ;;; eshell
   `(eshell-prompt
     ((,class256 (:foreground ,bright-magenta :weight bold))))
   `(eshell-ls-directory
     ((,class256 (:foreground ,blue :weight bold))))
   `(eshell-ls-symlink
     ((,class256 (:foreground ,cyan :weight bold))))
   `(eshell-ls-executable
     ((,class256 (:foreground ,green :weight bold))))
   `(eshell-ls-cluttern
     ((,class256 (:foreground ,red))))
   `(eshell-ls-archive
     ((,class256 (:foreground ,yellow))))
   `(eshell-ls-backup
     ((,class256 (:foreground ,darkgrey))))
   `(eshell-ls-unreadable
     ((,class256 (:foreground ,non-text))))
   `(eshell-ls-missing
     ((,class256 (:background ,red :foreground ,black))))
   `(eshell-ls-product
     ((,class256 (:foreground ,black))))
   `(eshell-ls-readonly
     ((,class256 (:foreground ,darkgrey))))
   `(eshell-ls-special
     ((,class256 (:foreground ,magenta))))

   ;;; eww
   `(eww-form-text
     ((,class256 (:inherit widget-field :box (:foreground ,grey)))))
   `(eww-form-textarea
     ((,class256 (:inherit widget-field))))
   `(eww-form-submit
     ((,class256 (:inherit custom-button))))
   `(eww-form-file
     ((,class256 (:inherit custom-button))))

   ;;; emms
   `(emms-playlist-selected-face
     ((,class256 (:foreground ,blue :weight bold))))
   `(emms-playlist-track-face
     ((,class256 (:foreground ,fg))))
   `(emms-browser-track-face
     ((,class256 (:inherit emms-playlist-track-face))))
   `(emms-browser-artist-face
     ((,class256 (:foreground ,blue))))
   `(emms-browser-album-face
     ((,class256 (:foreground ,yellow))))
   `(emms-browser-composer-face
     ((,class256 (:foreground ,cyan))))
   `(emms-browser-performer-face
     ((,class256 (:foreground ,magenta))))
   `(emms-browser-year/genre-face
     ((,class256 (:foreground ,red))))

   ;;; vertico
   `(vertico-current
     ((,class256 (:background ,hl-line))))

   ;;; orderless
   `(orderless-match-face-0
     ((,class256 (:foreground ,blue :weight bold))))
   `(orderless-match-face-1
     ((,class256 (:foreground ,magenta :weight bold))))
   `(orderless-match-face-2
     ((,class256 (:foreground ,green :weight bold))))
   `(orderless-match-face-3
     ((,class256 (:foreground ,yellow :weight bold))))

   ;;; marginalia
   `(marginalia-key
     ((,class256 (:foreground ,cyan))))
   `(marginalia-date
     ((,class256 (:foreground ,darkgrey))))

   ;;; consult
   `(consult-file
     ((,class256 (:foreground ,darkgrey))))
   `(consult-bookmark
     ((,class256 (:foreground ,comment))))
   `(consult-highlight-match
     ((,class256 (:background ,match))))

   ;;; notmuch
   `(notmuch-message-summary-face
     ((,class256 (:background ,grey2))))
   `(notmuch-tag-face
     ((,class256 (:foreground ,yellow))))
   `(notmuch-tag-unread
     ((,class256 (:foreground ,green))))
   `(notmuch-tag-flagged
     ((,class256 (:foreground ,blue))))
   `(notmuch-search-flagged-face
     ((,class256 (:foreground ,blue))))
   `(notmuch-tag-added
     ((,class256 (:underline ,cyan))))
   ;; XXX: should check for gui or strikethrough support...
   `(notmuch-tag-deleted
     ((,class256 (:foreground ,red :strike-through ,red))))

   ;;; verb (org based restclient)
   `(verb-http-keyword
     ((,class256 (:foreground ,blue))))
   `(verb-header
     ((,class256 (:foreground ,yellow))))
   `(verb-code-tag
     ((,class256 (:foreground ,cyan))))

   ;;; sly
   `(sly-mrepl-output-face
     ((,class256 (:foreground ,cyan))))

   ;;; corfu
   `(corfu-default
     ((,class256 (:background ,grey3))))
   `(corfu-current
     ((,class256 (:background ,grey1))))
   `(corfu-bar
     ((,class256 (:background ,grey))))
   `(corfu-border
     ((,class256 (:background ,grey))))

   ;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face
     ((,class256 (:foreground ,fg))))
   `(rainbow-delimiters-depth-2-face
     ((,class256 (:foreground ,blue))))
   `(rainbow-delimiters-depth-3-face
     ((,class256 (:foreground ,yellow))))
   `(rainbow-delimiters-depth-4-face
     ((,class256 (:foreground ,cyan))))
   `(rainbow-delimiters-depth-5-face
     ((,class256 (:foreground ,magenta))))
   `(rainbow-delimiters-depth-6-face
     ((,class256 (:foreground ,bright-blue))))
   `(rainbow-delimiters-depth-7-face
     ((,class256 (:foreground ,red))))
   `(rainbow-delimiters-depth-8-face
     ((,class256 (:foreground ,bright-cyan))))
   `(rainbow-delimiters-depth-9-face
     ((,class256 (:foreground ,bright-yellow))))

   `(tempel-default
     ((,class256 (:background ,diff-added-bg))))
   `(tempel-field
     ((,class256 (:background ,diff-added-bg))))
   `(tempel-form
     ((,class256 (:background unspecified))))

   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'wildcharm-light)
;;; wildcharm-light-theme.el ends here
