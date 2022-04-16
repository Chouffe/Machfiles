(module config.plugin.sexp
  {autoload {nvim aniseed.nvim}})

(defn config []
  (set nvim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet"))
