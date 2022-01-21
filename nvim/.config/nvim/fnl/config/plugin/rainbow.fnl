(module config.plugin.rainbow
  {autoload {nvim aniseed.nvim}})

(defn config []
  (set nvim.g.rainbow_active 1))
