; extends
(expansion [ "${" "}" ] @punctuation.special)

(subscript index: (word) @operator)

[ "[[" "]]" 
  "((" "))"] @function.builtin

(string [ "\"" ] @string.delimiter)
(test_operator ) @operator

(file_redirect destination: (word) @constant (#any-of? @constant "/dev/null"))

["|"   "|&"
 "||"  "&&"
 ">"   ">>"
 "<"   "<<"
 "<<-" "<<<"
 "=="  "!="
 ";&"  ";;&"
 ";"   ";;"] @operator

; ((word) @type (#lua-match? @type "^[-].*"))
