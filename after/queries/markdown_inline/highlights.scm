; extends
[
  (code_span_delimiter)] @tag.delimiter

(image [ "!" "[" "]" "(" ")" ] @tag.delimiter)
(image [ "!"  ] @operator)
(inline_link (["[" "]" "(" ")"] @tag.delimiter))
(shortcut_link [ "[" "]" ")" "(" ] @tag.delimiter)
