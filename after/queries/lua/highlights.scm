; extends

["string_start" "string_end"] @string.delimiter

(dot_index_expression
   table: (identifier) @namespace (#any-of? @namespace "vim"))

["local"] @storageclass

[":"] @operator

(function_call
  name: (identifier) @function.call)
