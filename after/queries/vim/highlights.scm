; extends

["let" "call" ] @storageclass
["execute"] @function.call
(literal_dictionary
  .
  ["#{"] @punctuation.special)
(literal_dictionary
    ["}"] @punctuation.special
    .)
