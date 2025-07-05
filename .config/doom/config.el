;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
(setq doom-font (font-spec :family "Berkeley Mono" :size 13 :weight 'book)
      doom-variable-pitch-font (font-spec :family "Berkeley Mono Variable" :size 13))
(setq doom-symbol-font "Symbols Nerd Font")

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Initial frame height and width
(add-to-list 'default-frame-alist '(height . 80))
(add-to-list 'default-frame-alist '(width . 200))

;; Changes for macOS
(cond
 (IS-MAC
  (setq mac-pass-control-to-system nil))) ;; Do not pass C-

;; Cycle buffers
(global-set-key (kbd "s-]") 'next-buffer)
(global-set-key (kbd "s-[") 'previous-buffer)

;; Clean buffers with Command-K
(defun kill-other-buffers ()
  "Kill all other buffers except the current one."
  (interactive)
  (let ((current (current-buffer)))
    (dolist (buf (buffer-list))
      (unless (eq buf current)
        (kill-buffer buf)))))
(global-set-key (kbd "s-K") 'kill-other-buffers)

;; Ctrl-K to kill line
(setq kill-whole-line t)

;; Exit without confirmation
(setq confirm-kill-emacs nil)

;; Clean LSP Modeline
(setq lsp-modeline-code-actions-enable nil
      lsp-modeline-code-actions-segments '(count name)
      lsp-modeline-diagnostics-enable t
      lsp-modeline-workspace-status-enable nil)

;; Clean LSP Sideline
(setq lsp-ui-sideline-enable nil
      lsp-ui-sideline-show-code-actions t
      lsp-ui-sideline-show-diagnostics t
      lsp-ui-sideline-code-actions-prefix "")

;; Clean LSP Headerline
(setq lsp-headerline-breadcrumb-enable nil
      lsp-headerline-breadcrumb-icons-enable nil)

;; Clean menubar
(let ((tool-items '(news
                    encrypt
                    quick-calc
                    directory
                    browse-net
                    mail
                    rmail
                    compose-mail
                    directory-search
                    browse-web
                    calendar
                    calc
                    simple-calculator
                    encryption-decryption
                    games
                    gnus)))
  (dolist (item tool-items)
    (define-key global-map (vector 'menu-bar 'tools item) nil)))

;; Window split with C-x |
(defun toggle-window-split ()
  "Toggle between vertical and horizontal split for two windows."
  (interactive)
  (when (= (count-windows) 2)
    (let* ((this-win-buffer (window-buffer))
           (next-win-buffer (window-buffer (next-window)))
           (this-win-edges (window-edges (selected-window)))
           (next-win-edges (window-edges (next-window)))
           (split-vertically
            (= (car this-win-edges)
               (car next-win-edges)))
           (splitter
            (if split-vertically
                #'split-window-horizontally
              #'split-window-vertically)))
      (delete-other-windows)
      (let ((first-win (selected-window)))
        (funcall splitter)
        (if split-vertically
            (set-window-buffer (next-window) next-win-buffer)
          (set-window-buffer (next-window) this-win-buffer))
        (select-window first-win)))))
(global-set-key (kbd "C-x |") #'toggle-window-split)
