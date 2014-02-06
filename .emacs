;*******************************************************************************;
;                                                                               ;
;                                                          :::      ::::::::    ;
;    dotemacs                                            :+:      :+:    :+:    ;
;                                                      +:+ +:+         +:+      ;
;    by: thor <thor@42.fr>                           +#+  +:+       +#+         ;
;                                                  +#+#+#+#+#+   +#+            ;
;    Created: 2013/06/18 14:01:14 by thor               #+#    #+#              ;
;    Updated: 2014/01/15 19:52:20 by aviala           ###   ########.fr        ;
;                                                                               ;
;*******************************************************************************;

; Load general features files
(setq config_files "/usr/share/emacs/site-lisp/")
(setq load-path (append (list nil config_files) load-path))

(load "list.el")
(load "string.el")
(load "comments.el")
(load "header.el")

; Set default emacs configuration
(set-language-environment "UTF-8")
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(global-set-key (kbd "DEL") 'backward-delete-char)
(setq-default c-backspace-function 'backward-delete-char)
(setq-default c-basic-offset 4)
(setq-default c-default-style "linux")
(setq-default tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60
                             64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))

(global-font-lock-mode 1)
(column-number-mode 1)
(line-number-mode 1)
(linum-mode 1)
(global-linum-mode 1)
(cua-mode 1)
;; Autorise la séléction à l'aide de la touche SHIFT
(custom-set-variables '(pc-selection-mode t nil (pc-select)))

;; Afficher la 'parenthèse correspondante'
(require 'paren)
(show-paren-mode)
(setq show-paren-style 'expression) ; highlight entire bracket expression
(electric-pair-mode 1)

(setq-default show-trailing-whitespace t)
(add-hook 'term-mode-hook
     (lambda() (make-local-variable 'show-trailing-whitespace)
       (setq show-trailing-whitespace nil)))

(setq inhibit-startup-message t)
(setq european-calendar-style t)

;; Custom commands.
(global-set-key "\C-cc" 'compile)
(global-set-key "\C-c\C-g" 'goto-line)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\M-n" 'forward-paragraph)
(global-set-key "\M-p" 'backward-paragraph)
(global-set-key "\C-xrv" 'list-registers)


(defun 42-indent-style ()
  (interactive)
  (c-set-style "bsd")
  (c-set-offset 'case-label 4)
  (setq c-basic-offset 4))

(menu-bar-mode nil)
(setq font-lock-maximum-size nil)

;; Highlight 80th column
(require 'whitespace)
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
pp  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))
(global-set-key [f6] 'iwb)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
