(module config.plugin.treesitter
  {autoload {treesitter nvim-treesitter.configs}})

(defn setup []
  (treesitter.setup {:highlight {:enable true}
                     :indent {:enable true}
                     :ensure_installed ["clojure"]}))

(setup)
