(module config.plugin.sexp
  {autoload {nvim aniseed.nvim}})

(defn setup []
  (set nvim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet"))

(setup)
