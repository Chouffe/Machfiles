(module config.keys.leader
  {autoload {a aniseed.core
             nvim aniseed.nvim
             str aniseed.string
             which-key which-key}})

(def- prefix "<Leader>")

(defn register-keybindings []
  (which-key.register
    {:F {:name "format"
         :j [":%!jq --sort-keys<CR>" "Format json"]
         :e [":%!jet --pretty<CR>" "Format edn"]}}
    {:prefix prefix})

  (which-key.register
    {:F {:name "format"
         :j [":!jq --sort-keys<CR>" "Format json"]
         :e [":!jet --pretty<CR>" "Format edn"]}}
    {:prefix prefix :mode :v}))
