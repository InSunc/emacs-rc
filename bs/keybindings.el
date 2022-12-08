(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

(use-package general
  :ensure t
  :after evil
  :config
  (general-evil-setup)

  (general-nmap
    "/" 'swiper
  )

  (general-imap
    "C-j" 'company-select-next
    "C-k" 'company-select-previous
  )
  
  (general-define-key
    :states '(normal visual emacs insert)
    "C-+" 'text-scale-increase
    "C--" 'text-scale-decrease
  )

  (general-define-key
   :keymap '(normal visual emacs insert)
    :states '(normal visual emacs)
    :prefix "SPC"
    "SPC" '(counsel-M-x :which-key "M-x")

    "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
    "`" '(neotree-toggle :which-key "neotree")
    "f" '(counsel-find-file :which-key "find file")

    ;; Buffer keybindings
    ;; ------------------
    "b]" '(next-buffer :which-key "next buffer")
    "b[" '(previous-buffer :which-key "previous buffer")
    "bb" '(ivy-switch-buffer :which-key "buffers")
    "by" '(buffer::copy :which-key "buffer yank")
    "bc" '(buffer::clear :which-key "buffer clear")
    "be" '(eval-buffer :which-key "eval buffer")

    "bK" '(kill-buffer :which-key "kill-buffer")

    "wl"  '(windmove-right :which-key "move right")
    "wh"  '(windmove-left :which-key "move left")
    "wk"  '(windmove-up :which-key "move up")
    "wj"  '(windmove-down :which-key "move bottom")
    "w\\"  '(split-window-right :which-key "split right")
    "w-"  '(split-window-below :which-key "split bottom")
    "wx"  '(delete-window :which-key "delete window")

    "ot"  '(term :which-key "open terminal")
    )
)


(provide 'bs-keybindings)
