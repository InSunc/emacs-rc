(defconst emacs-path "~/.emacs.d/")
(defconst bs-path (concat emacs-path "bs/"))
(defconst bs-leader-key "SPC")
(defconst bs-leader-alt-key "M-SPC")


;; Disable backup files
;;(setq make-backup-files nil) ; stop creating backup~ files
;;(setq auto-save-default nil) ; stop creating #autosave# files

(setq delete-old-versions -1 )		; delete excess backup versions silently
(setq version-control t )		; use version control
(setq vc-make-backup-files t )		; make backups file even when in version controlled dir
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) ; which directory to put backups file
(setq vc-follow-symlinks t )	       ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) ;transform backups file name
(setq inhibit-startup-screen t )	; inhibit useless and old-school startup screen
(setq ring-bell-function 'ignore )	; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8 )	; use utf-8 by default
(setq coding-system-for-write 'utf-8 )
(setq sentence-end-double-space nil)	; sentence SHOULD end with only a point.
(setq default-fill-column 80)		; toggle wrapping text at the 80th character


;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time



(require 'package)

(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
;; the following lines tell emacs where on the internet to look up
;; for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(require 'use-package)
;(use-package smooth-scrolling
;  :ensure t
;  :config
;  (smooth-scrolling-mode t)
;  (set-variable 'scroll-step 1)
;  )

(require 'bs-utils (concat bs-path "utils.el"))
(require 'bs-ui (concat bs-path "ui.el"))
(require 'bs-keybindings (concat bs-path "keybindings.el"))


(use-package evil
  :ensure t
  :defer .1
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1)
  (evil-set-undo-system 'undo-redo))

(use-package evil-escape
  :after evil
  :ensure t
  :init
  (setq-default evil-escape-key-sequence "jk")
  :config
  (evil-escape-mode 1))

(use-package evil-surround
  :after evil
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config (evil-collection-init))


;; Autocompletion
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (global-company-mode t)
)

(use-package irony
  :ensure t
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  (use-package company-irony
    :ensure t
    :config
    (add-to-list 'company-backends 'company-irony))
  )

(use-package sly
  :ensure t)



;(use-package helm
;  :ensure t
;  :pin melpa-stable
;  :if (display-graphic-p)
;  :diminish helm-mode
;  :bind (("M-x" . helm-M-x)
;         ("C-h SPC" . helm-all-mark-rings)
;         ("M-Y" . helm-show-kill-ring)
;         ("C-x b" . helm-mini)
;         ("C-x C-b" . helm-buffers-list)
;         ("C-M-l" . helm-buffers-list)

;         ("C-x C-S-b" . ibuffer)
;         ("C-x C-f" . helm-find-files)
;         ("C-x C-r" . helm-recentf)
;
;         ("C-x c !" . helm-calcul-expression)
;         ("M-:" . helm-eval-expression-with-eldoc)
;
;         ("C-h a" . helm-apropos)
;         ("C-h i" . helm-info-emacs)
;         ("C-h C-l" . helm-locate-library)
;         ("C-c h i" . helm-semantic-or-imenu)
;         )
;  :config
;  (setq helm-command-prefix-key "C-c h"
;        helm-split-window-in-side-p t
;        helm-buffers-fuzzy-matching t
;        helm-buffer-max-length nil
;        helm-recentf-fuzzy-match t
;        helm-apropos-fuzzy-match t
;        helm-move-to-line-cycle-in-source t
;        helm-ff-search-library-in-sexp t
;        helm-ff-file-name-history-use-recentf t
;        helm-ff-auto-update-initial-value t
;        helm-full-frame nil
;        )
;  (helm-mode))



;; Ivy and Counsel
(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :config
  (ivy-mode 1)
  (setq ivy-ignore-buffers '("\\` " "\\`\\*"))
  (setq enable-recursive-minibuffers t)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’.
  (setq ivy-use-virtual-buffers t)
  ;; number of result lines to display
  (setq ivy-height 10)
  (setq ivy-count-format "%d/%d ")
)

(use-package counsel :ensure t)
(use-package counsel-projectile :ensure t)

;; NeoTree
(use-package neotree
  :ensure t
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm evil-collection company-irony company counsel-projectile counsel ivy evil-surround which-key use-package neotree general evil-escape evil doom-themes all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
