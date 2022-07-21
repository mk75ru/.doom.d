;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Mikhail Krolikov"
      user-mail-address "krolikov@incom.tomsk.ru")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.



;;--- lsp ---
(add-hook 'cpp-mode-local-vars-hook #'lsp!)
(add-hook 'c-mode-local-vars-hook #'lsp!)
(add-hook 'c++-mode-local-vars-hook #'lsp!)

(after! ccls
  (setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
  (setq ccls-args '(--log-file=/tmp/ccls.out -v=1) )
  (set-lsp-priority! 'ccls 2)) ; optional as ccls is the default in Doom



;;
;;;;(setq xref-js2-search-program 'rg)
;; (setq lsp-lore-io 'true)


;; If a language or plugin provides a custom xref backend available for it, use
;; that instead. It will provide the best jump-to-definition and find-references
;; experience. You can specify custom xref backends with:
;;(set-lookup-handlers! 'js2-mode :xref-backend #'xref-js2-xref-backend)
;; NOTE: xref doesn't provide a :documentation backend.

;; Enabling only some features
;; (setq dap-auto-configure-features '(sessions locals controls tooltip))


;;--- rtags ---
;;(after! rtags
;;  (set-lookup-handlers! '(c-mode c++-mode) :async t
;;    :definition #'rtags-find-symbol-at-point
;;    :references #'rtags-find-references-at-point))



;;google-translate

(use-package! google-translate
  :defer 3
  :custom
  (google-translate-base-url "https://translate.google.ru/translate_a/single")
  (google-translate--tkk-url "https://translate.google.ru/")
  (google-translate-listen-url "https://translate.google.ru/translate_tts")
  (google-translate-backend-method 'curl)
  (google-translate-pop-up-buffer-set-focus t)
  (google-translate-default-source-language "en")
  (google-translate-default-target-language "ru")
  :config
  (when (and (string-match "0.11.18"
                           (google-translate-version))
             (>= (time-to-seconds)
                 (time-to-seconds
                  (encode-time 0 0 0 23 9 2018))))
    (defun google-translate--get-b-d1 ()
      ;; TKK='427110.1469889687'
      (list 427110 1469889687)))
  )


;;keybinding
(map! :leader
      ;;; <leader> a --- all
      (:prefix-map ("a" . "all")
       :desc "Compile"                               "c"   #'compile
       :desc "Recompile"                             "C"   #'recompile
       :desc "Jump to definition"                    "d"   #'+lookup/definition
       :desc "Jump to references"                    "D"   #'+lookup/references
       :desc "Jump to documentation"                 "k"   #'+lookup/documentation
       :desc "Find type definition"                  "t"   #'+lookup/type-definition
       :desc "List errors"                           "x"   #'flymake-show-diagnostics-buffer
       (:when (featurep! :checkers syntax)
        :desc "List errors"                          "x"   #'flycheck-list-errors)
       (:when (and (featurep! :tools lsp) (not (featurep! :tools lsp +eglot)))
        :desc "LSP Rename"                           "r"   #'lsp-rename)
       :desc "Snippet"                               "s"   #'yas-insert-snippet
       :desc "Add root project"      "a"   #'projectile-add-known-project
       :desc "Remove root project"   "u"   #'projectile-remove-current-project-from-known-projects
       )
)



(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))



;; original on https://gitlab.com/shilling.jake/emacsd/-/blob/dcc3c078a3f3df91b792721e639567e16b72a92f/config.org
(use-package! origami
  :diminish
  :config
  (defhydra hydra-origami (:color red)
    ("o" origami-open-node "open" :column "Open")
    ("O" origami-open-node-recursively "open recursively")
    ("C-o" origami-open-all-nodes "open all")
    ("c" origami-close-node "close" :column "Close")
    ("C" origami-close-node-recursively "close recursively")
    ("C-c" origami-close-all-nodes "close all")
    ("s" origami-show-node "show" :column "Show")
    ("S" origami-show-only-node "show only node")
    ("t" origami-forward-toggle-node "forward toggle" :column "Toggle")
    ("T" origami-recursively-toggle-node "toggle recursively")
    ("C-t" origami-toggle-all-nodes "toggle all")
    ("<left>" origami-undo "undo" :column "Undo/Redo")
    ("<right>" origami-redo "redo"))
  :bind (:map origami-mode-map
              ("C-c C-f" . origami-forward-fold-same-level)
              ("C-c C-b" . origami-backward-fold-same-level)
              ("C-c C-n" . origami-forward-fold)
              ("C-c C-p" . origami-previous-fold)
              ("C-c C-f" . origami-toggle-node)
              ("C-c C-o" . hydra-origami/body))
  :hook ((c-mode . origami-mode)
         (c++-mode . origami-mode)
         (java-mode . origami-mode)
         (clojure-mode . origami-mode)
         (js2-mode . origami-mode)
         (typescript-mode . origami-mode)
         (python-mode . origami-mode)
         (emacs-lisp-mode . origami-mode)))


(use-package! semantic-mode
  :hook ((c-mode . semantic-mode)
         (c++-mode . semantic-mode)
         )
)
(add-load-path!  "~/.doom.d/emacs.d")
(require 'doc-mode)
;;(add-hook 'prog-mode-hook #'doc-mode)
(add-hook 'c-mode-common-hook 'doc-mode)


;;(add-hook 'prog-mode-hook #'hs-minor-mode)
;;(setq hs-hide-all-non-comment-function #'ignore)


(use-package! lsp-mode
  :commands (lsp lsp-deferred)
  :init
  ; to get lsp-mode going with xtensa
  (setq lsp-clients-clangd-executable "clangd")
  (setq lsp-clients-clangd-args '("--query-driver=/**/bin/xtensa-esp32-elf-*" "--background-index" "--header-insertion=iwyu" "-j=4" "--log=verbose" ))
  :hook
  (c-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration))

(use-package! lsp-ui
  :commands lsp-ui-mode)
