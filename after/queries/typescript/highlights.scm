; extends

["'" "\"" "`"] @string.delimiter

["export" "import" "from"] @include

[ "type" "await" "async" "const" "let" "declare" "export" ] @storageclass

[("${" (_) (["}"] @punctuation.special))
 ("${" @punctuation.special)]

"module" @function.macro

["typeof" "keyof"] @operator

(super) @function.builtin

(new_expression
  constructor:
   (member_expression
        property: (property_identifier) @method.call)
  arguments: (_))


(intersection_type
    ("&" @operator))

(union_type
    ("|" @operator))

; {start_row}  {start_col}  {end_row}  {end_col}

("?.") @keyword

(mapped_type_clause) @operator

([(type_arguments [">" "<"] @storageclass)
  (type_parameters [">" "<"] @storageclass)])

(conditional_type
  (["?" ":"]) @operator)

(template_literal_type) @string


(type_parameter (type_identifier) @parameter)
(type_arguments (type_identifier) @parameter)

(conditional_type
  [(intersection_type
       (type_identifier) @parameter)
   (conditional_type
       (type_identifier) @parameter)])

(mapped_type_clause
  name: (type_identifier) @parameter)

(intersection_type
  (type_identifier) @type.builtin (#eq? @type.builtin "Object"))

(template_type
 (type_identifier) @parameter)
; ["async" "const" "await" "let" ] @storageclass
