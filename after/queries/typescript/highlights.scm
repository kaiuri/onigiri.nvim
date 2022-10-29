; extends
["'" "\"" "`"] @string.delimiter

["import" "from"] @keyword

(template_substitution
    ["${" "}"] @punctuation.special)

"module" @function.macro

(new_expression
  constructor:
   (member_expression
        property: (property_identifier) @method.call)
  arguments: (_))


