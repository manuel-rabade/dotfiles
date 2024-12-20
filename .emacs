;; ~/.emacs

;; --------------------------------------------------------------------
;; everything in the buffer

;; load vs-dark theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'vs-dark t)

;; font
(add-to-list 'default-frame-alist '(font . "Ubuntu Sans Mono-11"))

;; show matching parens
(require 'paren)

;; show bracket matching
(show-paren-mode t)

;; we like pretty colours for syntax highlighting
(setq-default font-lock-maximum-decoration t)

;; highlight selected regions
(transient-mark-mode t)

; cutoff for word wrap
(setq-default fill-column 160)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; when on a tab, make the cursor the tab length
(setq-default x-stretch-cursor t)

;; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; newline at the end of file
(setq require-final-newline 't)

;; encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; --------------------------------------------------------------------
;; mouse, keyboard & keybindings

;; treat 'y' or <CR> as yes, 'n' as no
(fset 'yes-or-no-p 'y-or-n-p)
    (define-key query-replace-map [return] 'act)
    (define-key query-replace-map [?\C-m] 'act)

;; goto-line
(global-set-key "\C-cc" 'goto-line)

;; match parenthesis
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))
  )
)
(global-set-key "\C-xx" 'match-paren)

;; mouse yank
(setq mouse-yank-at-point 't)

;; mouse wheel scroll
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)
(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)
(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

;; --------------------------------------------------------------------
;; mac os

(setq mac-option-key-is-meta t)
(setq mac-command-key-is-meta nil)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; --------------------------------------------------------------------
;; modes

;; local modes
(add-to-list 'load-path "~/.emacs.d/elisp/")

;; perl-mode
(setq perl-mode-hook
 '(lambda ()
   (setq indent-tabs-mode nil
    next-line-add-newlines nil
    standard-indent 2)
  (auto-fill-mode t)))

;; sql-mode
(eval-after-load "sql"
  '(load-library "sql-indent"))

;; puppet-mode
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; c-mode for ardu-ino files
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c-mode))

;; --------------------------------------------------------------------
;; backup & auto save

(make-directory "~/.emacs.d/auto-save" t)
(setq-default
 backup-by-copying t
 backup-directory-alist '(("." . "~/.emacs.d/auto-backup"))
 delete-old-versions t
 kept-new-versions 10
 kept-old-versions 0
 version-control t
 auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save/\\1" t))
 auto-save-default t
 auto-save-timeout 60
 auto-save-interval 100)

(require 'backup-each-save)
(add-hook 'after-save-hook 'backup-each-save)
(setq backup-each-save-mirror-location "~/.emacs.d/backup-each-save")

;; --------------------------------------------------------------------
;; misc

;; aspell
(setq-default
 ispell-program-name "aspell"
 ispell-dictionary "es")

;; set frame title
(setq frame-title-format "%b")

;; disable menu bar
(menu-bar-mode -1)

;; disable toolbar
(if (functionp 'tool-bar-mode) (tool-bar-mode -1))

;; disable startup message
(setq inhibit-startup-message t)

;; visible bell
(setq visible-bell t)

;; time
(display-time-mode t)

; show line numbers
(global-display-line-numbers-mode 1)

;; display the column number of the point in the mode line
(column-number-mode t)
(line-number-mode t)

;; --------------------------------------------------------------------
;; custom settings

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(javascript-indent-level 2)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
