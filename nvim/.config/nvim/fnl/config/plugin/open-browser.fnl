(fn config []
  (local nvim (require :aniseed.nvim))
  (set nvim.g.netrw_nogx 1)
  (set nvim.g.openbrowser_browser_commands
       [{:name "chromium" :args ["{browser}" "{uri}"]}
        {:name "firefox" :args ["{browser}" "{uri}"]}
        {:name "xdg-open" :args ["{browser}" "{uri}"]}])
  (nvim.set_keymap :n :gx "<Plug>(openbrowser-smart-search)" {})
  (nvim.set_keymap :v :gx "<Plug>(openbrowser-smart-search)" {}))

(comment
  (local nvim (require :aniseed.nvim))
  (set nvim.g.openbrowser_browser_commands
       [{:name "chromium" :args ["{browser}" "{uri}"]}])
  (nvim.print nvim.g.openbrowser_browser_commands)
  nvim.g.openbrowser_use_vimproc
  (config)
  ;; Open with gx
  "http://clojure.com")

{: config}
