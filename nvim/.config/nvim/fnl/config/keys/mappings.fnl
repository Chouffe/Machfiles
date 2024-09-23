(fn register-keybindings []
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 :v 2 "<Plug>(expand_region_expand)" :desc "expand region" :mode [:v]}
       {1 :<C-v> 2 "<Plug>(expand_region_shrink)" :desc "shrink region" :mode [:v]}
       {1 :- 2 ":Oil<CR>" :desc "oil: open parent directory"}])))
    ; (which-key.register
    ;   {:v ["<Plug>(expand_region_expand)" "expand region"]
    ;    :<C-v> ["<Plug>(expand_region_shrink)" "shrink region"]}
    ;   {:mode :v})))

{: register-keybindings}
