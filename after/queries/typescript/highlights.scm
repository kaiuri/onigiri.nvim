; extends

["'" "\"" "`"] @string.delimiter

["export" "import" "from"] @include

(template_substitution
    ["${" "}"] @punctuation.special)

[ "type" "await" "async" "const" "let" "declare" "export" ] @storageclass

"module" @function.macro

(super) @function.builtin

(new_expression
  constructor:
   (member_expression
        property: (property_identifier) @method.call)
  arguments: (_))


(intersection_type
    "&" @symbol)

(union_type
    "|" @symbol)

; {start_row}  {start_col}  {end_row}  {end_col}

("?.") @keyword

; ["async" "const" "await" "let" ] @storageclass
