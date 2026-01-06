(defvar elpaca-installer-version 0.11)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
    (defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
				:ref nil :depth 1 :inherit ignore
				:files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (<= emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                  ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                  ,@(when-let* ((depth (plist-get order :depth)))
                                                      (list (format "--depth=%d" depth) "--no-single-branch"))
                                                  ,(plist-get order :repo) ,repo))))
                  ((zerop (call-process "git" nil buffer t "checkout"
                                        (or (plist-get order :ref) "--"))))
                  (emacs (concat invocation-directory invocation-name))
                  ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                        "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                  ((require 'elpaca))
                  ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (let ((load-source-file-function nil)) (load "./elpaca-autoloads"))))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca elpaca-use-package
  (elpaca-use-package-mode))

;; THEME

(use-package exotica-theme
  :ensure t
  :config (load-theme 'exotica t))

;; PACKAGES

(use-package all-the-icons
  :ensure t)

(use-package centaur-tabs
  :ensure t
  :config
  (centaur-tabs-change-fonts "FiraCode Nerd Font Mono" 100)
  (setq centaur-tabs-background-color "#202020")
  :hook
  (dired-mode . centaur-tabs-local-mode)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

(use-package clang-format
  :ensure t)

(use-package cmake-integration
  :ensure (cmake-integration :type git :host github 
                             :repo "darcamo/cmake-integration")
  :commands (cmake-integration-conan-manage-remotes
             cmake-integration-conan-list-packages-in-local-cache
             cmake-integration-search-in-conan-center
             cmake-integration-transient)
  :custom
  (cmake-integration-generator "Ninja")
  (cmake-integration-use-separated-compilation-buffer-for-each-target t))

(use-package cmake-mode
  :ensure t)

(use-package cmake-project
  :ensure t)

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package dashboard
  :ensure t
  :config (dashboard-setup-startup-hook))

(use-package djvu
  :ensure t)

(use-package elcord
  :ensure t)

(use-package ess
  :ensure t)

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package helm-lsp :ensure t
  :commands helm-lsp-workspace-symbol)

(use-package load-env-vars :ensure t
  :config (load-env-vars (expand-file-name "~/Dotfiles/.env")))

(use-package lsp-ivy :ensure t
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (c++-mode . lsp)
         (csharp-mode . lsp)
	 (php-mode . lsp)
         (python-mode . lsp)
         (rust-mode . lsp)
         (vue-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-treemacs :ensure t
  :commands lsp-treemacs-errors-list
  :config (lsp-treemacs-sync-mode 1))

(use-package lsp-ui :ensure t
  :commands lsp-ui-mode)

(use-package magit :ensure t :after transient
  :config (setq magit-diff-refine-hunk 'all))

; https://www.reddit.com/r/emacs/comments/10h9jf0/comment/j5atwdh/
(use-package markdown-mode
  :hook
  (markdown-mode . nb/markdown-unhighlight)
  :ensure t
  :config
  (defvar nb/current-line '(0 . 0)
    "(start . end) of current line in current buffer")
  (make-variable-buffer-local 'nb/current-line)

  (defun nb/unhide-current-line (limit)
    "Font-lock function"
    (let ((start (max (point) (car nb/current-line)))
          (end (min limit (cdr nb/current-line))))
      (when (< start end)
        (remove-text-properties start end
                                '(invisible t display "" composition ""))
        (goto-char limit)
        t)))

  (defun nb/refontify-on-linemove ()
    "Post-command-hook"
    (let* ((start (line-beginning-position))
           (end (line-beginning-position 2))
           (needs-update (not (equal start (car nb/current-line)))))
      (setq nb/current-line (cons start end))
      (when needs-update
        (font-lock-fontify-block 3))))

  (defun nb/markdown-unhighlight ()
    "Enable markdown concealling"
    (interactive)
    (markdown-toggle-markup-hiding 'toggle)
    (font-lock-add-keywords nil '((nb/unhide-current-line)) t)
    (add-hook 'post-command-hook #'nb/refontify-on-linemove nil t))
  :custom-face
  (markdown-header-delimiter-face ((t (:foreground "#616161" :height 0.9))))
  (markdown-header-face-1 ((t (:height 1.6  :foreground "#A3BE8C" :weight extra-bold :inherit markdown-header-face))))
  (markdown-header-face-2 ((t (:height 1.4  :foreground "#EBCB8B" :weight extra-bold :inherit markdown-header-face))))
  (markdown-header-face-3 ((t (:height 1.2  :foreground "#D08770" :weight extra-bold :inherit markdown-header-face))))
  (markdown-header-face-4 ((t (:height 1.15 :foreground "#BF616A" :weight bold :inherit markdown-header-face))))
  (markdown-header-face-5 ((t (:height 1.1  :foreground "#b48ead" :weight bold :inherit markdown-header-face))))
  (markdown-header-face-6 ((t (:height 1.05 :foreground "#5e81ac" :weight semi-bold :inherit markdown-header-face))))
  :hook
  (markdown-mode . abbrev-mode))

(use-package mixed-pitch
  :ensure t
  :hook
  (org-mode . mixed-pitch-mode))

(use-package nov
  :ensure t)

(setq plstore-cache-passphrase-for-symmetric-encryption t)

;(use-package org-gcal :ensure t
;  :config
;  (setq org-gcal-client-id (getenv "GCAL_CLIENT_ID"))
;  (setq	org-gcal-client-secret (getenv "GCAL_CLIENT_SECRET"))
;  (setq	org-gcal-fetch-file-alist (list (cons (getenv "GCAL_CALENDARS_MAIN") "~/Calendars/main.org")
;					(cons (getenv "GCAL_CALENDARS_SCHEDULE") "~/Calendars/schedule.org")
;					(cons (getenv "GCAL_CALENDARS_IEEE") "~/Calendars/ieee.org")
;					(cons (getenv "GCAL_CALENDARS_ALUG") "~/Calendars/alug.org")))
;  (org-gcal-reload-client-id-secret)
;  (require 'plstore)
;  (add-to-list 'plstore-encrypt-to (getenv "GPG_KEY"))
;  ;(setq epg-pinentry-mode 'loopback)
;)

(use-package org-noter
  :ensure t)

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/UCI")
  :bind (
	 ("C-c n l" . org-roam-buffer-toggle)
	 ("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 )
  :config
  (org-roam-setup))

(use-package pdf-tools
  :ensure t
  :config
    (pdf-tools-install)
    (add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))
)

(use-package quarto-mode
  :ensure t
  :mode (("\\.qmd" . poly-quarto-mode))
  )

(use-package rainbow-mode
  :ensure t
  :hook ((markdown-mode . rainbow-mode)))

(use-package rust-mode
  :ensure t)

(use-package transient
  :ensure t)

(use-package treemacs
  :ensure t)

(use-package treemacs-all-the-icons
  :after (treemacs all-the-icons)
  :ensure t
  :config
  (treemacs-load-theme "all-the-icons"))

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package vterm
  :ensure t)

(use-package which-key
  :config (which-key-mode))

;; VARIABLES

; thank you chatgpt
(defun my/org-set-dictionary-from-language ()
  "Set `ispell-change-dictionary` directly from #+LANGUAGE: in Org file."
  (when (derived-mode-p 'org-mode)
    (let* ((lang (cdr (assoc "LANGUAGE" (org-collect-keywords '("LANGUAGE")))))
           (lang (car lang)))
      (when lang
        (ignore-errors
          (ispell-change-dictionary lang))))))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'org-mode-hook #'flyspell-mode)
(add-hook 'org-mode-hook #'global-display-line-numbers-mode)
(add-hook 'org-mode-hook #'my/org-set-dictionary-from-language)
(add-hook 'server-after-make-frame-hook 'revert-buffer)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

(setq create-lockfiles nil)

(setq centaur-tabs-height 32)
(setq centaur-tabs-icon-type 'all-the-icons)
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-style "wave")

(setq dashboard-agenda-prefix-format " %s %b ")
(setq dashboard-agenda-sort-strategy '(time-up))
(setq dashboard-banner-logo-title "Emacs")
(setq dashboard-center-content t)
(setq dashboard-display-icons-p t)
(setq dashboard-icon-type 'all-the-icons)
(setq dashboard-items '((recents   . 5)
			(agenda    . 5)))
(setq dashboard-set-file-icons t)
(setq dashboard-set-heading-icons t)
(setq dashboard-startup-banner 'logo)
(setq dashboard-vertically-center-content t)

(setq frame-title-format "%b - Emacs")

(setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))

(setq make-backup-files nil)

(setq org-agenda-files '("~/UCI/assignments.org"))

(setq org-roam-capture-templates
      '(
        ("a" "EECS 112L" plain "%?"
         :target (file+head "EECS112L/Notes/${slug}.org"
                            "#+TITLE: ${title}\n#+AUTHOR: Kasra Moayedi\n#+DATE: <%<%Y-%m-%d %a>>\n") :unnarrowed t)
        ("b" "FRENCH 116" plain "%?"
         :target (file+head "FRENCH 116/Notes/${slug}.org"
                            "#+TITLE: ${title}\n#+AUTHOR: Kasra Moayedi\n#+DATE: <%<%Y-%m-%d %a>>\n") :unnarrowed t)
        ("c" "ICS 6B" plain "%?"
         :target (file+head "ICS 6B/Notes/${slug}.org"
                            "#+TITLE: ${title}\n#+AUTHOR: Kasra Moayedi\n#+DATE: <%<%Y-%m-%d %a>>\n") :unnarrowed t)
        ("d" "MATH 3A" plain "%?"
         :target (file+head "MATH 3A/Notes/${slug}.org"
                            "#+TITLE: ${title}\n#+AUTHOR: Kasra Moayedi\n#+DATE: <%<%Y-%m-%d %a>>\n") :unnarrowed t)
        ("e" "PHYSICS 7D" plain "%?"
         :target (file+head "PHYSICS 7D/Notes/${slug}.org"
                            "#+TITLE: ${title}\n#+AUTHOR: Kasra Moayedi\n#+DATE: <%<%Y-%m-%d %a>>\n") :unnarrowed t)
        ("f" "PHYSICS 7LD" plain "%?"
         :target (file+head "PHYSICS 7LD/Notes/${slug}.org"
                            "#+TITLE: ${title}\n#+AUTHOR: Kasra Moayedi\n#+DATE: <%<%Y-%m-%d %a>>\n") :unnarrowed t)
        ("y" "ICS 46" plain "%?"
         :target (file+head "ICS 46/Notes/${slug}.org"
                            "#+TITLE: ${title}\n#+AUTHOR: Kasra Moayedi\n#+DATE: <%<%Y-%m-%d %a>>\n") :unnarrowed t)
        ("z" "STATS 67" plain "%?"
         :target (file+head "STATS 67/Notes/${slug}.org"
                            "#+TITLE: ${title}\n#+AUTHOR: Kasra Moayedi\n#+DATE: <%<%Y-%m-%d %a>>\n") :unnarrowed t)
        )
      )

(setq vc-follow-symlinks t)

;; MISC

(add-to-list 'default-frame-alist
             '(font . "0xProto Nerd Font Mono-11"))


(global-set-key [C-M-tab] 'clang-format-buffer)
(global-set-key [f2] 'toggle-menu-bar-mode-from-frame)

(use-package emacs
  :ensure nil
  :config (setq ring-bell-function #'ignore))

(auto-save-mode -1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setenv "FrameworkPathOverride" "/usr/lib/mono/3.5-api")

(cua-mode t)

(setq-default cursor-type 'bar)

(c-set-offset 'case-label '+)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(add-hook 'pdf-view-mode-hook #'pdf-view-midnight-minor-mode)
(add-hook 'pdf-view-mode-hook #'auto-revert-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("6198e96f1fd7de3889a1b6ab8be1fc9b7c734cc9db0b0f16b635a2974601f977"
     default))
 '(doc-view-continuous t)
 '(elcord-editor-icon "emacs_pen_icon")
 '(org-babel-load-languages '((python . t) (C . t) (R . t) (emacs-lisp . t)))
 '(org-preview-latex-default-process 'dvisvgm)
 '(pdf-view-continuous t)
 '(pdf-view-selection-style 'glyph))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
