(module config.plugin.open-browser
  {autoload {nvim aniseed.nvim}})

(defn config []
  ;; Recommended Setting from openbrowser introduction
  (set nvim.g.netrw_nogx 1)
  (nvim.set_keymap :n :gx "<Plug>(openbrowser-smart-search)" {})
  (nvim.set_keymap :v :gx "<Plug>(openbrowser-smart-search)" {}))
