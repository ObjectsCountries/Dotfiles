;; Set up MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; For OmniSharp to work
(setenv "FrameworkPathOverride" "/usr/lib/mono/4.8-api")

(require 'cl-lib)

;; LSP packages to install:
;; omnisharp-roslyn ruff typescript typescript-language-server vue-language-server
(defvar my-packages
  '(dashboard elcord evil magit markdown-mode monokai-theme npm treemacs treemacs-evil treemacs-icons-dired treemacs-magit treemacs-projectile typescript-mode web-mode)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (cl-loop for p in my-packages
           when (not (package-installed-p p)) do (cl-return nil)
           finally (cl-return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; web-mode setup
(define-derived-mode vue-mode web-mode "Vue")
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))

(defun vue-eglot-init-options ()
             (let ((tsdk-path (expand-file-name
                               "lib"
                               (string-trim-right (shell-command-to-string "npm list --global --parseable typescript | head -n1")))))
               `(:typescript (:tsdk ,tsdk-path
                              :languageFeatures (:completion
                                                 (:defaultTagNameCase "both"
                                                  :defaultAttrNameCase "kebabCase"
                                                  :getDocumentNameCasesRequest nil
                                                  :getDocumentSelectionRequest nil)
                                                 :diagnostics
                                                 (:getDocumentVersionRequest nil))
                              :documentFeatures (:documentFormatting
                                                 (:defaultPrintWidth 100
                                                  :getDocumentPrintWidthRequest nil)
                                                 :documentSymbol t
                                                 :documentColor t)))))

;; Volar
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
                          `(vue-mode . ("vue-language-server" "--stdio" :initializationOptions ,(vue-eglot-init-options)))))

;; TypeScript
(cl-defmethod project-root ((project (head eglot-project)))
  (cdr project))
(defun my-project-try-tsconfig-json (dir)
  (when-let* ((found (locate-dominating-file dir "tsconfig.json")))
    (cons 'eglot-project found)))
(add-hook 'project-find-functions
          'my-project-try-tsconfig-json nil nil)
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((typescript-mode) "typescript-language-server" "--stdio")))

;; Setup
(evil-mode 1)
(load-theme 'deeper-blue t)
(which-key-mode)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(setq vc-follow-symlinks t)
(setq frame-title-format "%b - Emacs")

;; Markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
             '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(with-eval-after-load 'markdown-mode
  (define-key markdown-mode-map (kbd "C-c C-e") #'markdown-do))

;; Dashboard
(setq dashboard-display-icons-p t)
(setq dashboard-icon-type 'nerd-icons)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-banner-logo-title "Emacs")
(setq dashboard-startup-banner 'logo)
(setq dashboard-center-content t)
(setq dashboard-vertically-center-content t)
(setq dashboard-items '((recents   . 5)
                        (projects  . 5)
                        (agenda    . 5)))
(require 'dashboard)
(dashboard-setup-startup-hook)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elcord-editor-icon "emacs_pen_icon")
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
