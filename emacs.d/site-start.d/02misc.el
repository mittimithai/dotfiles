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

(auto-fill-mode -1)
(add-hook 'tex-mode-hook 'turn-on-reftex)
(add-hook 'tex-mode-hook 'turn-on-flyspell)
(add-hook 'tex-mode-hook 'flyspell-mode)
(add-hook 'tex-mode-hook 'visual-line-mode)

(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'latex-mode-hook 'turn-on-flyspell)
(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'latex-mode-hook 'visual-line-mode)

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

(require 'ibuffer)
(global-set-key (kbd "C-x C-b")  'ibuffer-other-window)

(setq ibuffer-saved-filter-groups
      (quote (("default"
	       ("dired" (mode . dired-mode))
	       ("perl" (mode . cperl-mode))
	       ("erc" (mode . erc-mode))
	       ("planner" (or
			   (name . "^\\*Calendar\\*$")
			   (name . "^diary$")
			   (mode . muse-mode)))
	       ("emacs" (or
			 (name . "^\\*scratch\\*$")
			 (name . "^\\*Messages\\*$")))
	       ("gnus" (or
			(mode . message-mode)
			(mode . bbdb-mode)
			(mode . mail-mode)
			(mode . gnus-group-mode)
			(mode . gnus-summary-mode)
			(mode . gnus-article-mode)
			(name . "^\\.bbdb$")
			(name . "^\\.newsrc-dribble")))))))

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-switch-to-saved-filter-groups "default")))

(add-hook 'html-mode-hook 'turn-off-auto-fill)

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(defun sudo-edit (&optional arg)
    "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
    (interactive "P")
    (if (or arg (not buffer-file-name))
	(find-file (concat "/sudo:root@localhost:"
			   (ido-read-file-name "Find file(as root): ")))
          (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
