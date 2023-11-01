(fn register-keybindings []
  (let [which-key (require :which-key)]
    (which-key.register
      {:v ["<Plug>(expand_region_expand)" "expand region"]
       :<C-v> ["<Plug>(expand_region_shrink)" "shrink region"]}
      {:mode :v})))

{: register-keybindings}
