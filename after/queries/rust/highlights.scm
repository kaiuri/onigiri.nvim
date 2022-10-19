; extends
(macro_definition "macro_rules!" @keyword.function)

(macro_invocation "!" @punctuation.special)

(fragment_specifier) @type.builtin
(metavariable) @parameter 

(token_binding_pattern ":" @punctuation.special)

(string_literal "\"" @string.delimiter)

(macro_definition name: (identifier) @function)

(macro_invocation macro: (identifier) @function.call)


(closure_expression
 (closure_parameters ["|"] @keyword))

((identifier) @type.builtin
 (#any-of? @type.builtin "Some" "None" "Ok" "Err"))

(inner_attribute_item
 (meta_item
  (identifier) @function.call))
 
(inner_attribute_item
 (meta_item
  (meta_arguments
    (meta_item
      (identifier) @parameter))))

(attribute_item
 (attr_item
    (identifier) @function.call))

(let_declaration ["let"] @keyword.function) 
(closure_expression ["move"] @keyword.function)

(type_arguments  ["<" ">"] @punctuation.bracket)
(type_parameters ["<" ">"] @punctuation.bracket)

(lifetime [ "'" ] @string.delimiter) 
(lifetime (identifier) @tag) 

(self_parameter
 (self) @parameter)

(call_expression
 function:
  (field_expression
   field: (_) @method.call))
