(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages '(vcomplete wgrep))
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(warning-suppress-log-types '((find-file-hook) (find-file-hook)))
 '(warning-suppress-types '((find-file-hook)))
 '(woman-manpath
   '("/usr/share/gcc-data/x86_64-pc-linux-gnu/11.3.0/man" "/usr/share/binutils-data/x86_64-pc-linux-gnu/2.37_p1/man" "/usr/local/share/man" "/usr/share/man" "/usr/lib/llvm/14/share/man" "~/.cache/cppman")))

'(package-selected-packages '(wgrep))

(add-load-path!  "doom-custom.d")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(setfont)
 '(font-lock-builtin-face ((t (:foreground "magenta3"))))
 '(font-lock-comment-face ((t (:foreground "saddle brown"))))
 '(font-lock-constant-face ((t (:foreground "orange red"))))
 '(font-lock-function-name-face ((t (:inherit bold :foreground "#4078f2"))))
 '(font-lock-type-face ((t (:foreground "magenta1"))))
 '(font-lock-variable-name-face ((t (:foreground "orange")))))
(put 'customize-group 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
