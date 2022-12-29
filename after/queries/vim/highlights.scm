; extends

["let" "call" "set" ] @storageclass
["execute" "highlight"] @macro

(literal_dictionary
  .
  ["#{"] @punctuation.special)
(literal_dictionary
    ["}"] @punctuation.special
    .)
