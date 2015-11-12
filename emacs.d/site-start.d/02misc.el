;;autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1")) t)
  '(warning-suppress-types (quote ((undo discard-info))))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)


(defun rename-current-file-or-buffer ()
  (interactive)
  (if (not (buffer-file-name))
      (call-interactively 'rename-buffer)
    (let ((file (buffer-file-name)))
      (with-temp-buffer
        (set-buffer (dired-noselect file))
        (dired-do-rename)
        (kill-buffer nil))))
  nil)

(global-set-key (kbd "C-c R") 'rename-current-file-or-buffer)

(add-hook 'c-mode-common-hook
              '(lambda ()
                     (c-set-offset 'substatement-open 0)
                     (if (assoc 'inexpr-class c-offsets-alist)
                             (c-set-offset 'inexpr-class 0))))

(setq tab-width 4)
(setq indent-tabs-mode nil)
(menu-bar-mode -1)

(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'latex-mode-hook 'turn-on-flyspell)

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
	(revert-buffer t t t) )))
      (message "Refreshed open files.") )

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(show-paren-mode 1) ; turn on paren match highlighting
(setq show-paren-style 'expression) ; highlight entire bracket expression

(desktop-save-mode 1) ; save/restore opened files
