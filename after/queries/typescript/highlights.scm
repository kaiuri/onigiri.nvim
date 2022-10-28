; extends
["'" "\"" "`"] @string.delimiter

["import" "from"] @keyword

(template_substitution
    ["${" "}"] @punctuation.special)

"module" @function.macro
