; extends

["'" "\"" "`"] @string.delimiter

["export" "import" "from"] @include

[ "await" "async" "const" "let" "export" ] @storageclass

[("${" (_) (["}"] @punctuation.special))
 ("${" @punctuation.special)]

