(add-to-list 'load-path "~/.emacs.d/lisp/")

;;; via: http://www.plope.com/Members/chrism/flymake-mode
(when (load "flymake" t) 
  (defun flymake-pyflakes-init () 
    (let* ((temp-file (flymake-init-create-temp-buffer-copy 
		       'flymake-create-temp-inplace)) 
	   (local-file (file-relative-name 
			temp-file 
			(file-name-directory buffer-file-name)))) 
      (list "flake8" (list local-file)))) 
  
  (add-to-list 'flymake-allowed-file-name-masks 
	       '("\\.py\\'" flymake-pyflakes-init))) 

(add-hook 'find-file-hook 'flymake-find-file-hook)
(put 'downcase-region 'disabled nil)

(load "color-theme-tomorrow")

(color-theme-tomorrow-night)