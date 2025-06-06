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
(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 15))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

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

(add-hook 'window-setup-hook 'toggle-frame-maximized t)
;(elcord-mode)
(setenv "FrameworkPathOverride" "/usr/lib/mono/4.8-api")
(use-package! lsp-bridge
  :config
  (global-lsp-bridge-mode))

;; Can also be set through `M-x RET customize-group RET verilog-ext':
;; Comment out/remove the ones you do not need
(setq verilog-ext-feature-list
      '(font-lock
        xref
        capf
        hierarchy
        eglot
        lsp
                                        ; lsp-bridge
                                        ;lspce
        flycheck
        beautify
        navigation
        template
        formatter
        compilation
        imenu
        which-func
        hideshow
        typedefs
        time-stamp
        block-end-comments
        ports))
(require 'verilog-ext)
;(verilog-ext-mode-setup)
(add-hook 'verilog-mode-hook #'verilog-ext-mode)

(require 'auto-complete)
(global-auto-complete-mode t)

(add-hook 'prog-mode-hook 'flycheck-mode)
(setq doom-theme 'doom-monokai-machine)

;(add-to-list 'auto-mode-alist '("\\.cs\\'" . csharp-mode))
;(add-hook 'csharp-mode-hook 'csharp-mode)
;(map! "SPC f g" 'lsp-format-buffer)
;(lsp-treemacs-sync-mode 1)



(setq dashboard-display-icons-p t)
(setq dashboard-icon-type 'nerd-icons)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
(setq dashboard-banner-logo-title "Emacs")
(setq dashboard-startup-banner 'logo)
(setq dashboard-center-content t)
(setq dashboard-vertically-center-content t)
(setq dashboard-items '((recents   . 5)
                        (projects  . 5)
                        (agenda    . 5)))
(require 'dashboard)

(require 'load-env-vars)
(load-env-vars "~/.doom.d/.env")

(setq org-gcal-client-id (getenv "GCAL_ID")
      org-gcal-client-secret (getenv "GCAL_SECRET")
      org-gcal-fetch-file-alist (list (cons (getenv "GCAL_EMAIL_MAIN") "~/Calendars/main.org")
                                      (cons (getenv "GCAL_EMAIL_SCHEDULE") "~/Calendars/schedule.org")
                                      (cons (getenv "GCAL_EMAIL_IEEE") "~/Calendars/ieee.org")
                                )
)
(setq plstore-cache-passphrase-for-symmetric-encryption t)
(require 'org-gcal)
(require 'plstore)
(add-to-list 'plstore-encrypt-to (getenv "GPG_KEY"))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq initial-buffer-choice #'dashboard-open)

(require 'org-agenda)
(use-package markdown-mode
:commands gfm-mode markdown-mode
:mode
("README\\.md\\'" . gfm-mode)
("\\.md\\'" . markdown-mode)
("\\.markdown\\'" . markdown-mode)
:custom
(markdown-header-scaling t)
(markdown-fontify-code-blocks-natively t)
)
