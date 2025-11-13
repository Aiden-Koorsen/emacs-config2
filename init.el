;; ===========================
;; Basic UI Cleanup
;; ===========================
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)

;; ===========================
;; Package Management Setup
;; ===========================
(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; ===========================
;; Install Required Packages
;; ===========================
(dolist (pkg '(company use-package doom-themes))
  (unless (package-installed-p pkg)
    (package-install pkg)))

(require 'use-package)
(setq use-package-always-ensure t)

;; ===========================
;; UI and Theme
;; ===========================
(load-theme 'doom-ir-black t) ;; You can switch to doom-dracula, doom-nord, etc.

;; Set default font to Consolas (ensure it’s installed)
(set-face-attribute 'default nil :font "Consolas-12")

;; Enable line numbers globally
(global-display-line-numbers-mode 1)

;; ===========================
;; Autocomplete (Company Mode)
;; ===========================
(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0.1
      company-minimum-prefix-length 1
      company-selection-wrap-around t)

;; ===========================
;; Odin Mode (Local File)
;; ===========================
;; Adjust this path to wherever odin-mode.el lives
(add-to-list 'load-path "~/.emacs.d/lisp/")  ;; example directory
(require 'odin-mode)

(add-to-list 'auto-mode-alist '("\\.odin\\'" . odin-mode))

(add-hook 'odin-mode-hook
          (lambda ()
            (setq tab-width 4)))

;; ===========================
;; Misc
;; ===========================
(setq make-backup-files nil
      auto-save-default nil)

(provide 'init)
;;; init.el ends here
