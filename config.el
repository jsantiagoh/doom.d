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

(setq doom-font (font-spec :family "Iosevka SS04" :size 16 :weight 'regular)
      doom-big-font (font-spec :family "Iosevka SS04" :size 24)
      doom-variable-pitch-font (font-spec :family "Iosevka Aile" :size 16 :weight 'regular)  ;; font used also for zen mode
      doom-serif-font (font-spec :family "Iosevka Aile" :size 16 :weight 'regular))

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
;; (setq doom-theme 'doom-gruvbox-light)
(setq doom-theme 'doom-ayu-light)
;; (setq doom-theme 'doom-flatwhite)

;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type 'relative)
(setq display-line-numbers-type 'nil)

;; Show previews when switching buffers
(setq +ivy-buffer-preview t)

;; Icons in treemacs are huge
(setq all-the-icons-scale-factor 1.0)

;; Yasnippet directory
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.doom.d/snippets")))

;; Org mode configuration
;; --------------------------------------------------------------------------------
;; Set the jar path for plant uml
(setq org-plantuml-jar-path "~/opt/plantuml.jar")


(let ((default-directory "~/Notes/"))
  (setq org-directory (expand-file-name ""))
  (setq org-download-image-dir (expand-file-name "img"))
  (setq san-capture-meetings-file (expand-file-name "Tiqets/meetings.org"))
  (setq org-attach-id-dir (expand-file-name "attachments")) ;; The directory where attachments are stored when ‘ID’ is used as method.
  (setq org-mobile-directory (expand-file-name "mobile/"))  ;; Org Mobile
  (setq org-mobile-inbox-for-pull (expand-file-name "mobile/from-mobile.org"))
  (setq org-agenda-files (list (expand-file-name "")
                            (expand-file-name "Tiqets"))))
(after! org
  (setq org-fontify-quote-and-verse-blocks t
        org-startup-folded t
        org-ellipsis " "
        org-capture-templates
        '(("t" "Todo" entry (file+headline +org-capture-todo-file "Inbox") "* TODO %?\n%i\n%a" :prepend t)
          ("n" "Notes" entry (file+headline +org-capture-notes-file "Inbox") "* %u %?\n%i\n%a" :prepend t)
          ("m" "Meeting" entry (file+headline san-capture-meetings-file "Meetings") "* %U %?\nParticipants:\n\n** Actions")
          ("j" "Journal" entry (file+olp+datetree +org-capture-journal-file) "* %U %?\n%i\n%a" :prepend t))))


;; Org Agenda configuration
;; taken from https://github.com/tecosaur/emacs-config
(use-package! org-super-agenda
  :commands (org-super-agenda-mode))

(after! org-agenda
  (org-super-agenda-mode))

(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-tags-column 100 ;; from testing this seems to be a good value
      org-agenda-compact-blocks t)

(setq org-agenda-custom-commands
      '(("o" "Overview"
         ((agenda "" ((org-agenda-span 'day)
                      (org-super-agenda-groups
                       '((:name "Today"
                          :time-grid t
                          :date today
                          :todo "TODAY"
                          :scheduled today
                          :order 1)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:name "Next to do"
                           :todo "NEXT"
                           :order 1)
                          (:name "Important"
                           :tag "Important"
                           :priority "A"
                           :order 6)
                          (:name "Due Today"
                           :deadline today
                           :order 2)
                          (:name "Due Soon"
                           :deadline future
                           :order 8)
                          (:name "Overdue"
                           :deadline past
                           :face error
                           :order 7)))))))))

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
