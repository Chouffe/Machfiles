let g:vimclojure#HighlightBuiltins=1
let g:vimclojure#ParenRainbow=1

let g:clojure_highlight_references=1
let g:clojure_fuzzy_indent = 1
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^fact', '^facts', '^tabular', 'if', 'when', '^test-extractor', 'against-background']
let g:clojure_fuzzy_indent_blacklist = ['-fn$', '\v^with-%(meta|out-str|loading-context)$']

let g:clj_fmt_autosave = 1

let g:sexp_insert_after_wrap = 0 " Disable insertion after wrapping
let g:sexp_enable_insert_mode_mappings = 0 " Make sure vim-sexp plays nicely with parinfer
