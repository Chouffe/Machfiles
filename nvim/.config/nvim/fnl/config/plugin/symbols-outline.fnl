(module config.plugin.symbols-outline
  {autoload {a aniseed.core
             nvim aniseed.nvim}})

(defn config []
  ;; Does not seem to work
  (set nvim.g.symbols_outline {:width 50}))

(comment
  (set nvim.g.symbols_outline {:width 50})
  nvim.g.symbols_outline.width)
