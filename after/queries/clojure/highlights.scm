; extends

((sym_lit) @keyword (#any-of? @keyword "let" "defn" "defmacro"))

(regex_lit
 marker: "#" @symbol)

(anon_fn_lit
  (sym_lit) @parameter (#lua-match? @parameter "%%%d"))

(anon_fn_lit
 marker: ("#") @keyword)

(derefing_lit
 marker: ("@") @character.special)

(kwd_lit) @field
