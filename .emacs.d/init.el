(add-to-list 'exec-path "/usr/local/bin/")
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/")

;; Save mini-buffer history
;; via: http://stackoverflow.com/a/1230877
(savehist-mode 1)

;; via: http://melpa.org/#/getting-started
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;; via: http://stackoverflow.com/a/17430474
(setq org-agenda-custom-commands
      '(("W" "Completed and/or deferred tasks from previous week"
	 ((agenda "" ((org-agenda-span 7)
		      (org-agenda-start-day "-7d")
		      (org-agenda-entry-types '(:timestamp))
		      (org-agenda-show-log t)))))))

;;; via: http://www.plope.com/Members/chrism/flymake-mode
(when (load "flymake" t)
  ;;; via: http://www.emacswiki.org/emacs/FlymakeHtml
  (defun flymake-html-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "tidy" (list local-file))))

  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "flake8" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.html$\\|\\.ctp" flymake-html-init))

  (add-to-list 'flymake-err-line-patterns
	       '("line \\([0-9]+\\) column \\([0-9]+\\) - \\(Warning\\|Error\\): \\(.*\\)"
		 nil 1 2 4))
  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)
(put 'downcase-region 'disabled nil)

;;(load-theme 'tomorrow-night t)
;;(load "~/.emacs.d/lisp/color-theme-tomorrow.el")
;;(color-theme-tomorrow-night)


(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tomorrow-night-eighties)))
 '(custom-safe-themes
   (quote
    ("e439d894bf9406baf73056cf7e3c913ee5c794b6adadbbb9f614aebed0fd9ce7" default)))
 '(org-agenda-files (quote ("~/Projects/log/fy16-q1.org")))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
