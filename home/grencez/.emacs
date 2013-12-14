
(tooltip-mode -1) ; Remove tooltips

; load the ProofGeneral configuration
;(load-file "/usr/share/emacs/site-lisp/ProofGeneral/generic/proof-site.el")

(custom-set-variables
 '(blink-cursor-mode nil)
 '(transient-mark-mode nil))
(custom-set-faces)

(add-to-list 'load-path "~/.emacs.d/el-get/evil")
(require 'evil)
(evil-mode 1)

(load "elscreen" "ElScreen" t)
(define-key evil-normal-state-map (kbd "t") 'elscreen-find-file) ;creat tab
(define-key evil-normal-state-map (kbd "C-w c") 'elscreen-kill) ;kill tab
(define-key evil-normal-state-map "gT" 'elscreen-previous) ;previous tab
(define-key evil-normal-state-map "gt" 'elscreen-next) ;next tab

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
(el-get 'sync)

(setq inferior-lisp-program "/usr/bin/ccl")
(add-to-list 'load-path "~/hacking/lisp/slime")
(require 'slime)
(slime-setup)

(setq-default c-default-style "linux")
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 2)
(set-default-font "-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1")

