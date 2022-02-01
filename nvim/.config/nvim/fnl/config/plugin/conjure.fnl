(module config.plugin.conjure
  {autoload {nvim aniseed.nvim}})

(defn config []
  (set nvim.g.conjure#mapping#doc_word "K")
  (set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
  ; (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled true)
  (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false))
