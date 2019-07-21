(defun buffer::copy()
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max)))

(defun buffer::clear()
  (interactive)
  (delete-region (point-min) (point-max)))



(provide 'bs-utils)
