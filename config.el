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

(setq doom-font (font-spec :family "Iosevka SS04" :size 14 :weight 'regular)
      doom-big-font (font-spec :family "Iosevka SS04" :size 18)
      doom-variable-pitch-font (font-spec :family "Iosevka Etoile" :size 14 :weight 'regular)  ;; font used also for zen mode
      doom-serif-font (font-spec :family "Iosevka Aile" :size 14 :weight 'regular))

(setq ns-option-modifier 'meta
      ns-right-option-modifier 'meta)

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

;; Set the jar path for plant uml
(setq org-plantuml-jar-path "~/opt/plantuml.jar")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq
 org-directory "~/Notes/"
 org-agenda-files '("~/Notes/" "~/Notes/Tiqets" "~/Notes/Tiqets/people/")
 org-agenda-custom-commands '(("x" todo "TODO"))
 org-startup-folded t
 )
;; Bullets for org mode
(setq org-superstar-headline-bullets-list
       '("❖" "⨳" "⟫" "⟩" "⟩" "⟩" "⟩" "⟩" "⟩" "⟩" "⟩" "⟩" "⟩" "⟩" ))

(setq org-hide-emphasis-markers nil)

(setq org-link-abbrev-alist '(("doom-repo" . "https://github.com/hlissner/doom-emacs/%s")
                              ("wolfram" . "https://wolframalpha.com/input/?i=%s")
                              ("wikipedia" . "https://en.wikipedia.org/wiki/%s")
                              ("duckduckgo" . "https://duckduckgo.com/?q=%s")
                              ("gmap" . "https://maps.google.com/maps?q=%s")
                              ("gimages" . "https://google.com/images?q=%s")
                              ("google" . "https://google.com/search?q=")
                              ("youtube" . "https://youtube.com/watch?v=%s")
                              ("github" . "https://github.com/%s")
                              ("jira" . "https://tiqets.atlassian.net/browse/%s")))

(setq org-capture-templates
      '(("t" "Personal todo" entry (file+headline +org-capture-todo-file "Inbox") "* TODO %?\n%i\n%a" :prepend t)
        ("n" "Personal notes" entry (file+headline +org-capture-notes-file "Inbox") "* %u %?\n%i\n%a" :prepend t)
        ("j" "Journal" entry (file+olp+datetree +org-capture-journal-file) "* %U %?\n%i\n%a" :prepend t)
        ("p" "Templates for projects")
        ("pt" "Project-local todo" entry (file+headline +org-capture-project-todo-file "Inbox") "* TODO %?\n%i\n%a" :prepend t)
        ("pn" "Project-local notes" entry (file+headline +org-capture-project-notes-file "Inbox") "* %U %?\n%i\n%a" :prepend t)
        ("pc" "Project-local changelog" entry (file+headline +org-capture-project-changelog-file "Unreleased") "* %U %?\n%i\n%a" :prepend t)
        ("o" "Centralized templates for projects")
        ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\n %i\n %a" :heading "Tasks" :prepend nil)
        ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?\n %i\n %a" :heading "Notes" :prepend t)
        ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?\n %i\n %a" :heading "Changelog" :prepend t)))

;; Autosave org mode files
(add-hook 'org-mode-hook #'auto-save-visited-mode)

(map! :leader :desc "Org Columns" "o c" #'org-columns)

;; Add a timestamp when completing tasks
(setq org-log-done t)

;; Icons in treemacs are huge
(setq all-the-icons-scale-factor 1.0)

;; Yasnippet directory
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.doom.d/snippets")))

;; Org Roam configuration
(setq org-roam-directory "~/Notes")

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
