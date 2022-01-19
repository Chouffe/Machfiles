(module config.plugin.rainbow
  {autoload {nvim aniseed.nvim}})

(defn setup []
  (set nvim.g.rainbow_active 1))

(setup)
