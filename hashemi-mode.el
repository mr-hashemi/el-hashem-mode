(defun hashemi-mode-re-grab (inner) (concat "\\(" inner "\\)"))
(defun hashemi-mode-re-word (inner) (concat "\\<" inner "\\>"))

(defconst hashemi-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?' "\"" table)
    (modify-syntax-entry ?\" "\"" table)
    (modify-syntax-entry ?/ ". 12" table)
    (modify-syntax-entry ?\n ">" table)
    table))

(define-derived-mode hashemi-mode prog-mode "Mr. Hashemi Mode"
  :syntax-table hashemi-mode-syntax-table
  (font-lock-fontify-buffer))

(defface hashem-mode-builtin-face
  '((t :inherit font-lock-builtin-face))
  "Face for builtins."
  :group 'hashemi-mode)

(defvar hashemi-mode-builtin
  '("bekhoon" "bechap" "benevis" "jadid")
  "List of builtins")

(defconst hashemi-mode-keywords
  '("bebin" "badi" "khob" "age" "bood" "na?" "ta" "bede"))


(font-lock-add-keywords 'hashemi-mode '(( "\\(bebin\\|badi\\|khob\\|ta\\|age\\|na\\?\\|bede\\)"
					  (1 'font-lock-keyword-face))))


(font-lock-add-keywords 'hashemi-mode '(( "\\(bebin\\)[ \t\n]+\\(\\(\\sw\\|\\s_\\)+\\)"
					  (2 'font-lock-warning-face)
					  (1 'font-lock-keyword-face))))

(font-lock-add-keywords 'hashemi-mode '(( "\\(age\\|ta\\)[ \t\n].*[ \t\n]+\\(bood\\)"
					  (1 'font-lock-keyword-face)
					  (2 'font-lock-keyword-face))))

(font-lock-add-keywords 'hashemi-mode  '(( "[ \t\n]\\(\\(\\sw\\|\\s_\\)+\\)[ \t\n]*=[\t\n]*.*\\(;\\)"
					   (1 'font-lock-type-face)
					   (2 'font-lock-negation-face))))

(add-to-list 'auto-mode-alist '("\\.hashem\\'" . hashemi-mode))

(provide 'hashemi-mode)
