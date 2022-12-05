; extends
(expansion [ "${" "}" ] @punctuation.special)

; (command_substitution
;     "$("  @punctuation.special
;      (_)
;      ")"  @punctuation.special
;      .)

(subscript index: (word) @operator)

[ "[[" "]]"
   "[" "]"
  "((" "))"] @function.builtin

(string [ "\"" ] @string.delimiter)
(test_operator ) @operator

(file_redirect destination: (word) @constant (#any-of? @constant "/dev/null"))

["|&"
 "&>"
 ">&"
 ; ">"
 ; ">>"
 ; "<"
 ; "<<"
 "<<<"
 ; "=="
 ; "!="
 ";&"
 ";;&"
 ";;"
 ";"
 "!"
 "<<-"] @operator

("${"
 "#" @operator)

(heredoc_start) @constant

(file_descriptor) @number

["declare" "local" "export" ] @storageclass

; (case_item
;  (word)
;  [")"] @operator)
;

; not sure about this one
; (case_statement
;     (case_item
;         value: (word) @regex (#eq? @regex "*")
;         (")") @punctuation.special))
