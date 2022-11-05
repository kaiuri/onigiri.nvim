; extends
["\""] @string.delimiter

(pair key:
  (string (string_content) @tag)
  (#lua-match? @tag "^%$"))

