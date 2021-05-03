;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(menu-bar-mode -1)

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
 ;; (setq doom-font (font-spec :family "monospace" :size 16 :weight 'semi-light)
 ;;       doom-variable-pitch-font (font-spec :family "sans" :size 17))
;; (setq doom-font (font-spec :family "Iosevka" :size 14 :weight 'regular)
;;       doom-variable-pitch-font (font-spec :family "Fira Sans" :size 14))

;; (setq doom-font (font-spec :family "Iosevka SS04" :size 18 :weight 'regular)
;;      doom-big-font (font-spec :family "Iosevka SS04" :size 26)
;;      doom-variable-pitch-font (font-spec :family "Iosevka Aile" :size 18 :weight 'regular)  ;; font used also for zen mode
;;      doom-serif-font (font-spec :family "Iosevka Aile" :size 18 :weight 'regular))

(setq doom-font (font-spec :family "Iosevka SS04" :size 18 :weight 'regular)
     doom-big-font (font-spec :family "Iosevka SS04" :size 26)
     doom-variable-pitch-font (font-spec :family "Iosevka Etoile" :size 18 :weight 'light)  ;; font used also for zen mode
     doom-serif-font (font-spec :family "Iosevka Aile" :size 18 :weight 'regular))

(setq doom-leader-key "SPC"
      doom-localleader-key ","
      doom-leader-alt-key "M-SPC"
      doom-localleader-alt-key "M-SPC m")


(setq ns-option-modifier 'meta
      ns-right-option-modifier 'meta)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'santiago)
(setq doom-theme 'doom-gruvbox-light)
;; (setq doom-theme 'doom-one-light)
;; (setq doom-theme 'doom-flatwhite)

;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type 'relative)
(setq display-line-numbers-type 'nil)

;; Show previews when switching buffers
(setq +ivy-buffer-preview t)

;; Icons in treemacs are huge
(setq all-the-icons-scale-factor 1.0)

;; Org mode configuration
;; --------------------------------------------------------------------------------
;; Set the jar path for plant uml
(setq org-plantuml-jar-path "~/opt/plantuml.jar")

;; The directory where attachments are stored when ‘ID’ is used as method.
(setq org-attach-id-dir "~/Notes/Tiqets/attachments")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq
 org-directory "~/Notes/Tiqets"
 org-agenda-files '("~/Notes/Tiqets" "~/Notes/Tiqets/people/")
 org-download-image-dir "~/Notes/Tiqets/img")

;; Yasnippet directory
;(setq yas-snippet-dirs (append yas-snippet-dirs
;                               '("~/.doom.d/snippets")))

;; Org Roam configuration
(setq org-roam-directory "~/Notes/Tiqets")

(after! org
  (setq org-fontify-quote-and-verse-blocks t
        org-startup-folded t
        org-ellipsis " …"
        org-capture-templates
        '(("t" "Todo" entry (file +org-capture-todo-file) "* TODO %?\n%i\n%a")
          ("n" "Notes" entry (file+headline +org-capture-notes-file "Inbox") "* %u %?\n%i\n%a")
          ("m" "Meeting" entry (file+headline "~/Notes/Tiqets/meetings.org" "Meetings") "* %U %?\nParticipants:\n\n** Actions")
          ("i" "Interview" entry (file+headline "~/Notes/Tiqets/hiring.org" "Interviews") "* %U %?\n" :prepend nil)
          ("j" "Journal" entry (file+olp+datetree +org-capture-journal-file) "* %U %?\n%i\n%a"))
        ))

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (alltodo "")))))

;; Bullets for org mode
(setq org-superstar-headline-bullets-list
       '("❖" "⨳" "⟫" "⟩" "⁖" "⁖" "⁖" "⁖" "⁖" "⁖" "⁖" "⁖" "⁖" "⁖" ))

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



;; (setq org-capture-templates
;;       '(("t" "Tiqets todo" entry (file+headline +org-capture-todo-file "Inbox") "* TODO %?\n%i\n%a" :prepend t)
;;         ("n" "Tiqets notes" entry (file+headline +org-capture-notes-file "Inbox") "* %u %?\n%i\n%a" :prepend t)
;;         ("j" "Journal" entry
;;          (file+olp+datetree +org-capture-journal-file)
;;          "* %U %?\n%i\n%a" :prepend t)
;;         ("p" "Templates for projects")
;;         ("pt" "Project-local todo" entry (file+headline +org-capture-project-todo-file "Inbox") "* TODO %?\n%i\n%a" :prepend t)
;;         ("pn" "Project-local notes" entry (file+headline +org-capture-project-notes-file "Inbox") "* %U %?\n%i\n%a" :prepend t)
;;         ("pc" "Project-local changelog" entry (file+headline +org-capture-project-changelog-file "Unreleased") "* %U %?\n%i\n%a" :prepend t)
;;         ("o" "Centralized templates for projects")
;;         ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\n %i\n %a" :heading "Tasks" :prepend nil)
;;         ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?\n %i\n %a" :heading "Notes" :prepend t)
;;         ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?\n %i\n %a" :heading "Changelog" :prepend t)))

;; Autosave org mode files
(add-hook 'org-mode-hook #'auto-save-visited-mode)
(add-hook 'org-mode-hook #'+org-pretty-mode)
(add-hook 'org-mode-hook #'mixed-pitch-mode)
(add-hook 'org-mode-hook #'org-appear-mode)

(map! :leader
      :desc "Org Columns" "o c" #'org-columns)
(map! :leader
      :desc "Org Capture"           "x" #'org-capture
      :desc "Pop up scratch buffer" "X" #'doom/open-scratch-buffer)

;; Add a timestamp when completing tasks
(setq org-log-done t)

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
