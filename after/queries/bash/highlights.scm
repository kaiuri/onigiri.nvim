; extends
(expansion [ "${" "}" ] @punctuation.special)

(subscript index: (word) @operator)

[ "[[" "]]"
  "((" "))"] @function.builtin

(string [ "\"" ] @string.delimiter)
(test_operator ) @operator

(file_redirect destination: (word) @constant (#any-of? @constant "/dev/null"))

["|&"
 ">&"
 ; ">"
 ; ">>"
 ; "<"
 ; "<<"
 ; "<<<"
 ; "=="
 ; "!="
 ; ";&"
 ; ";;&"
 ; ";;"
 ";"
 "<<-"] @operator

(file_descriptor) @number


; ((word) @type (#lua-match? @type "^[-].*"))
(test_command
  "[["
  (binary_expression
   right:
    (concatenation
      (word) @punctuation.special
      (#any-of? @punctuation.special "\*"))))
