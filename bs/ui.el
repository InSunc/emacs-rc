;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
(global-linum-mode t)

(setq-default
 ansi-color-for-comint-mode t
 bidi-display-reordering nil ; disable bidirectional text for tiny performance boost
 blink-matching-paren nil    ; don't blink--too distracting
 compilation-always-kill t        ; kill compilation process before starting another
 compilation-ask-about-save nil   ; save all buffers on `compile'
 compilation-scroll-output 'first-error
 confirm-nonexistent-file-or-buffer t
 cursor-in-non-selected-windows nil ; hide cursors in other windows
 display-line-numbers-width 3
 echo-keystrokes 0.02
 enable-recursive-minibuffers nil
 frame-inhibit-implied-resize t
 frame-title-format '("%b – BlackSugar") ; simple name in frame title
 ;; remove continuation arrow on right fringe
 fringe-indicator-alist
 (delq (assq 'continuation fringe-indicator-alist)
       fringe-indicator-alist)
 highlight-nonselected-windows nil
 image-animate-loop t
 indicate-buffer-boundaries nil
 indicate-empty-lines nil
 max-mini-window-height 0.3
 mode-line-default-help-echo nil ; disable mode-line mouseovers
 mouse-yank-at-point t           ; middle-click paste at point, not at click
 show-help-function nil          ; hide :help-echo text
 use-dialog-box nil              ; always avoid GUI
 uniquify-buffer-name-style 'forward
 visible-cursor nil
 x-stretch-cursor nil
 ;; Favor vertical splits
 split-width-threshold 160
 split-height-threshold nil
 ;; `pos-tip' defaults
 pos-tip-internal-border-width 6
 pos-tip-border-width 1
 ;; no beeping or blinking please
 ring-bell-function #'ignore
 visible-bell nil
 ;; don't resize emacs in steps, it looks weird
 window-resize-pixelwise t
 frame-resize-pixelwise t)
;; y/n instead of yes/no
(fset #'yes-or-no-p #'y-or-n-p)
;; Truly silence startup message
(fset #'display-startup-echo-area-message #'ignore)
;; enabled by default; no thanks, too distracting
(blink-cursor-mode -1)


(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t)
  (setq doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (load-theme 'doom-one t)
)

(use-package all-the-icons :ensure t)

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1)

;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode 1))


(provide 'bs-ui)
