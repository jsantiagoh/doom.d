;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Santiago"
      user-mail-address "santiago@tiqets.com")

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
;; (setq doom-font (font-spec :family "Iosevka" :size 14 :weight 'regular)
;;       doom-variable-pitch-font (font-spec :family "Fira Sans" :size 14))

(setq doom-font (font-spec :family "Iosevka SS05" :size 14 :weight 'regular)
      doom-big-font (font-spec :family "Iosevka SS05" :size 16)
      doom-variable-pitch-font (font-spec :family "Iosevka Aile" :size 14 :weight 'regular)  ;; font used also for zen mode
      doom-serif-font (font-spec :family "Iosevka Aile" :size 14 :weight 'regular))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-gruvbox-light)
;; (setq doom-theme 'doom-one-light)
(setq doom-theme 'santiago)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type 'relative)
(setq display-line-numbers-type 'nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq
 org-directory "~/Notes/"
 org-agenda-files '("~/Notes/" "~/Notes/people/")
 org-agenda-custom-commands '(("x" todo "TODO"))
 org-superstar-headline-bullets-list '("❖" "⨳" "⟫" "⟩" "⟩" "⟩" "⟩" "⟩" "⟩" "⟩" "⟩" "⟩" "⟩" "⟩" )   ;; Bullets for org mode
 )

;; Autosave org mode files
(add-hook 'org-mode-hook #'auto-save-visited-mode)

(map! :leader :desc "Org Columns" "o c" #'org-columns)

;; Add a timestamp when completing tasks
(setq org-log-done t)

;; Icons in treemacs are huge
(setq all-the-icons-scale-factor 1.0)

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
