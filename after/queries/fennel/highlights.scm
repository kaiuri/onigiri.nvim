; extends
[ "\"" "'" ] @string.delimiter
[ "`" ] @operator

(list (_ (string) @field (#match? @field "^:")))

(fn name: (symbol) @function)

(list (_) @operator (#any-of? @operator "=" "+"))

(hashfn ["#"] @operator)

(list
 (symbol) @keyword (#any-of? @keyword "macro")
 (symbol) @symbol
 (sequential_table))

(list
 (symbol)
 (symbol)
 (sequential_table
  [(sequential_table
    (symbol) @parameters)]))

(quoted_list
  (symbol) @keyword (#any-of? @keyword "let"))

(unquote [","] @operator)

(lambda ["lambda" ("λ")] @keyword)
(match ["match"] @keyword.function)

(list
  .
  (symbol) @storageclass
  (symbol) @function.call
  (sequential_table (symbol))
  (list
    (symbol)))

["local"] @storageclass
