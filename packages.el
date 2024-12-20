
;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)
(package! wgrep)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

;;(package! dap-mode)


;;------- lsp -----
(package! lsp-mode)
(package! lsp-ui)
(package! lsp-ivy)
(package! helm-lsp)
;;(package! eglot)
;;
;;(setq lsp-clients-clangd-args '("-j=3"
;;                                "--background-index"
;;                                "--clang-tidy"
;;                                "--completion-style=detailed"
;;                                "--header-insertion=never"
;;                                "--header-insertion-decorators=0"))
;;(after! lsp-clangd (set-lsp-priority! 'clangd 2))

;;------------------







(package! cmake-mode)

(package! cuda-mode)

(package! demangle-mode)

(package! disaster)

(package! modern-cpp-font-lock)

(package! opencl-mode)

(package! glsl-mode)

(package! company-glsl)


;;-lsp
;;(package! irony)

;;(package! irony-eldoc)

;;(package! flycheck-irony)

;;(package! company-irony)

;;(package! company-irony-c-headers)

;;(package! rtags)

;;(package! ivy-rtags)

;;(package! helm-rtags)

(package! go-translate)

(package! posframe)

;;+lsp
(package! ccls)

;;(after! lsp-mode
;;  (set-lsp-priority! 'ccls 1))
;;
(after! ccls
  (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
  (set-lsp-priority! 'ccls 2)) ; optional as ccls is the default in Doom

;;translate
(package! google-translate)
;;set
;;     google-translate-default-target-language
;;


; Doxymacs is Doxy
;;(package! doxymacs)
(package! highlight-doxygen)

(package! tidy)


(package! modern-cpp-font-lock)



(package! tree-sitter)
(package! tree-sitter-langs)

(package! mustache-mode)

(package! color-identifiers-mode)

(after! color-identifiers-mode
  (add-hook 'after-init-hook 'global-color-identifiers-mode)
)

(package! pandoc)

;;(package! origami)

(package! hydra)

;;(package! history)

;;(package! arduino-mode)

;;(package! exec-path-from-shell)

(package! dts-mode)

(package! ejson-mode)

(package! json-mode)

(package! yafolding)

(package! org-vcard)

(package! vcard)
