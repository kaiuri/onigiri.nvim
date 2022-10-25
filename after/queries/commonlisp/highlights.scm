; extends

(str_lit ["\""] @string.delimiter)

((sym_lit) @keyword.function
 (#any-of? @keyword.function "let" "if"))

((sym_lit) @operator
 (#any-of? @operator "not"))

((sym_lit) @function.builtin
 (#any-of? @function.builtin
  "error" "match-string"
  "getenv" "string-match"
  "expand"))


