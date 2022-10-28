; extends

(import_statement
    "import"
    name: (dotted_name
            (identifier) @namespace))


(string "\"" @string.delimiter)

(keyword_argument
    name: (identifier) @field)

(function_definition
    ":" @punctuation.delimiter)
