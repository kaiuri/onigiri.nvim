; extends
["'" "\"" "`"] @string.delimiter

(import_statement ["import" "from"] @keyword)
(template_substitution
    ["${" "}"] @punctuation.special)
