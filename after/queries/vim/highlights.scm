; extends

["let" "call" "set" ] @storageclass
["execute"] @function.call
(literal_dictionary
  .
  ["#{"] @punctuation.special)
(literal_dictionary
    ["}"] @punctuation.special
    .)
