(module config.plugin.sexp
  {autoload {a aniseed.core
             nvim aniseed.nvim}})

(defn config []
  (set nvim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet"))
