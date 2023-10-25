(module config.plugin.vim-illuminate
  {autoload {illuminate illuminate}})

(defn config []
  (illuminate.configure {:delay 200}))
