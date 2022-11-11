; extends

; (list_lit
;   .
;   (sym_lit) @function.call
;   (_))

(str_lit ["\""] @string.delimiter)

((sym_lit) @keyword
 (#any-of? @keyword "let" "setq" "let*" "setf"))
;
((sym_lit) @operator
 (#any-of? @operator "not" "or" "equal" "=" "+" "-" "/"))
;
((sym_lit) @function.builtin
 (#any-of? @function.builtin
  "error" "match-string"
  "getenv" "string-match"
  "setenv" "push"
  "eval"
  "dolist" "concat"
  "expand" "cadr"))

((sym_lit) @conditional
 (#any-of? @conditional "if" "when-let" "when" "unless" "cond"))

((sym_lit) @constant.builtin
 (#any-of? @constant.builtin "t" "nil"))

(kwd_lit) @field
