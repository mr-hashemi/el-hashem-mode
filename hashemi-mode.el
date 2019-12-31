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


(defconst hashemi-mode-keywords
  '("bebin"
    "badi" "khob"
    "age" "bood"
    "na?" "ta"
    "bede" 
    "yield"))

(font-lock-add-keywords 'hashemi-mode
			'(( "\\(bebin\\)[ \t\n]+\\(\\(\\sw\\|\\s_\\)+\\)"
			    (2 'font-lock-variable-name-face)
			    (1 'font-lock-keyword-face)
			    )))

(font-lock-add-keywords 'hashemi-mode
			'(( "\\(ta\\)[ \t\n].*[ \t\n]+\\(bood\\)"
			    (1 'font-lock-keyword-face)
			    (2 'font-lock-keyword-face)
			    )))

(add-to-list 'auto-mode-alist '("\\.hashem\\'" . hashemi-mode))

(provide 'hashemi-mode)
