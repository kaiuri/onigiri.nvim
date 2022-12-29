; extends
; TODO: Code cleanup
[ "\"" "'" ] @string.delimiter
[ "`" ] @operator

(list (_ (string) @field (#match? @field "^:")))

(fn name: (symbol) @function)

(list (_) @operator (#any-of? @operator "=" "+"))

(hashfn ["#"] @operator)

(list
 (symbol) @storageclass (#any-of? @storageclass "macro")
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

(lambda ["lambda" ("λ")] @storageclass)
(match ["match"] @keyword.function)
["fn"] @storageclass

(list
  .
  (symbol) @storageclass
  (symbol) @function.call
  (sequential_table (symbol))
  (list
    (symbol)))

["local"] @storageclass
