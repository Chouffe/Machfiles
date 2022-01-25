(module config.plugin.nvim-tree
  {autoload {a aniseed.core
             nvim aniseed.nvim
             nvim-tree nvim-tree}})

(defn config []
  (nvim-tree.setup))
