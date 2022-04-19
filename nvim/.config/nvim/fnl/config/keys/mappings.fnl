(module config.keys.mappings
  {autoload {a aniseed.core
             nvim aniseed.nvim
             str aniseed.string
             functions config.general.functions
             which-key which-key}})

(defn register-keybindings []
  (which-key.register
    {:v ["<Plug>(expand_region_expand)" "expand region"]
     :<C-v> ["<Plug>(expand_region_shrink)" "shrink region"]}
    {:mode :v}))
