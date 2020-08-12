;; .emacs.d/init.el
;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)
;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;; Initializes the package infrastructure
(package-initialize)
;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))
;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(all-the-icons                   ;; Lots of icons
    better-defaults                 ;; Set up some better Emacs defaults
    disable-mouse                   ;; Disable the mouse!
    doom-modeline                   ;; Doom emacs modeline
    doom-themes                     ;; Doom emacs themes
    elpy                            ;; Emacs Lisp Python
    flycheck                        ;; On the fly syntax checking
    blacken                         ;; Black formatting on save
    ein                             ;; Emacs IPython Notebook
    material-theme                  ;; Theme
    use-package                     ;; For using packages
    which-key                       ;; Use Which Key helper
    )
)
;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; ===================================
;; Basic Customization
;; ===================================

(setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(which-key-mode)                    ;; Load Which Key minor mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(global-hl-line-mode +1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(delete-selection-mode 1)
(show-paren-mode 1)

;; ====================================
;; Ido Mode
;; ====================================
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

;; ====================================
;; Theme Setup
;; ====================================
(require 'use-package)

(use-package doom-themes
	     :ensure t
	     :config
	     (load-theme 'doom-acario-dark t))

(use-package doom-modeline
	     :ensure t
	     :hook (after-init  . doom-modeline-mode))

(use-package all-the-icons
  :ensure t)

;; ===========================
;; Development Setup
;; ====================================
;; Enable elpy
(elpy-enable)
;; Use IPython for REPL
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")
;; Enable Flycheck
 (when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Use Projectile project
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1))

;; Use Dashboard for dashboard
(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '((recents . 5)
			    (projects . 5))))
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-heading-icons t)
  :config
  (dashboard-setup-startup-hook))

;; Use Treeemacs for exploring files
(use-package treemacs
  :ensure t
  :bind
  (:map global-map
	([F8] . treemacs)
	("C-<f8>" . treemacs-select-window))
  :config
  (setq treemacs-is-never-other-window t))

;; Use Treemacs Projectile
(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

;; Stop reacting to mouse
(global-disable-mouse-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (treemacs-projectile which-key use-package treemacs projectile material-theme flycheck elpy ein doom-themes doom-modeline disable-mouse dashboard blacken better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
