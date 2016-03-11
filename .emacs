;; When moving machines/installations, be sure to move scripts in .emacs.d.
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(require 'column-marker)
(add-hook 'c-mode-hook (lambda () (interactive) (column-marker-1 78)))
(add-hook 'c++-mode-hook (lambda () (interactive) (column-marker-1 78)))
(add-hook 'tex-mode-hook (lambda () (interactive) (column-marker-1 80)))

;;(require 'linux-style-c)
(setq c-default-style
           '((c-mode . "linux")))
(setq c-default-style
           '((c++-mode . "linux")))
(setq-default c-basic-offset 8
	      tab-width 8
	      indent-tabs-mode t)

(setq-default show-trailing-whitespace t)

(require 'unfill-region)

;; Scroll down with cursor one line at a time
(setq scroll-step 1)
(put 'narrow-to-region 'disabled nil)

(add-to-list 'auto-mode-alist '("\\.ae\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.hae\\'" . c-mode))
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))

;;Use aspell instead of ispell
(setq ispell-program-name "aspell")
(setq ispell-list-command "list")
(setq ispell-extra-args '("--sug-mode=ultra"))

;;F5-F8 used for development-oriented commands
(global-set-key (quote [f5]) 'compile)
(global-set-key (quote [f6]) 'vc-diff)

;;F9-F12 used for text-oriented commands
(global-set-key (quote [f9]) 'unfill-paragraph)
