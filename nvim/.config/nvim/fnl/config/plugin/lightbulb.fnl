(module config.plugin.lightbulb
  {autoload {a aniseed.core
             nvim aniseed.nvim
             lightbulb nvim-lightbulb}
   require-macros [config.macros]})

(defn config []
  (augroup :my_lightbulb_config
    (autocmd :CursorHold  "*" "lua require('nvim-lightbulb').update_lightbulb()")
    (autocmd :CursorHoldI "*" "lua require('nvim-lightbulb').update_lightbulb()")))
