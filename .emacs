;; ~/.emacs

;; --------------------------------------------------------------------
;; fonts, faces and eveything in the buffer

;; encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; disable menu bar
(menu-bar-mode -1)

;; font, colors and cursor
(setq default-frame-alist
 '((font . "-*-terminal-medium-r-*-*-14-*-*-*-*-*-iso8859-1")
   (cursor-color . "Green")
   (cursor-type . box)
   (foreground-color . "WhiteSmoke")
   (face-background . "Black")
   (background-color . "Black")))

;; pretty fonts
(global-font-lock-mode t)

;; show matching parens
(require 'paren)

;; show bracket matching
(show-paren-mode t)

;; we like pretty colours for syntax highlighting
(setq-default font-lock-maximum-decoration t)

;; highlight selected regions
(transient-mark-mode t)

;; when on a tab, make the cursor the tab length
(setq-default x-stretch-cursor t)

;; disable startup message
(setq inhibit-startup-message t)

;; --------------------------------------------------------------------
;; mouse, keyboard and keybindings

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

; cutoff for word wrap
(setq-default fill-column 72)

;; treat 'y' or <CR> as yes, 'n' as no
(fset 'yes-or-no-p 'y-or-n-p)
    (define-key query-replace-map [return] 'act)
    (define-key query-replace-map [?\C-m] 'act)


;; C-- keybinding for undo (removes the shift) 
(global-set-key [(control -)] 'undo)

;; goto-line
(global-set-key "\C-cc" 'goto-line)

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
;; status bar

;; time
(display-time)

;; display the column number of the point in the mode line
(column-number-mode t)
(line-number-mode t)

;; --------------------------------------------------------------------
;; misc

;; gentoo stuff
;(require 'site-gentoo)

;; aspell
(setq-default ispell-program-name "aspell")
(setq ispell-dictionary "es")

;; easy switching to buffers
(require 'iswitchb)

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

;; visible bell
(setq visible-bell t)

;; --------------------------------------------------------------------
;; modes

;; local path
(add-to-list 'load-path "~/.elisp/")

;; perl-mode
(setq perl-mode-hook
 '(lambda ()
   (setq fill-column 72
    indent-tabs-mode nil
    next-line-add-newlines nil
    standard-indent 2)
  (auto-fill-mode t)))

;; ebuild-mode
(defun ebuild-mode () 
  (shell-script-mode) 
  (sh-set-shell "bash") 
  (make-local-variable 'tab-width) 
  (setq tab-width 4)) 
(setq auto-mode-alist (cons '("\\.ebuild\\'" . ebuild-mode) auto-mode-alist)) 
(setq auto-mode-alist (cons '("\\.eclass\\'" . ebuild-mode) auto-mode-alist))

;; sql-mode
(eval-after-load "sql"
  '(load-library "sql-indent"))

;; --------------------------------------------------------------------
;; custom settings

(auto-save-mode -1)
(setq-default make-backup-files nil)
(setq-default auto-save-default t)
(setq-default auto-save-interval 300)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(display-time-mode t)
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
