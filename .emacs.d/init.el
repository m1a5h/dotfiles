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

  '(better-defaults                 ;; Set up some better Eemacs defaults
    disable-mouse                   ;; Disable the mouse!
    elpy                            ;; Emacs Lisp Python
    flycheck                        ;; On the fly syntax checking
    blacken                         ;; Black formatting on save
    ein                             ;; Emacs IPython Notebook
    material-theme                  ;; Theme
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

(global-linum-mode t)               ;; Enable line numbers globally

(menu-bar-mode -1)

(toggle-scroll-bar -1)

(tool-bar-mode -1)

;; ====================================

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

(global-disable-mouse-mode)

;; User-Defined init.el ends here.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (disable-mouse material-theme flycheck elpy ein blacken better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
