(module config.plugin.neomake
  {autoload {nvim aniseed.nvim}})

(defn config []
  (print "CONFIG NEOMAKE"))
  ; (vim.api.nvim_command "call neomake#configure#automake(\"w\")"))
  ; (vim.api.nvim_call_function "neomake#configure#automake" ["inw"]))


; (comment
;   (vim.api.nvim_call_function "neomake#configure#automake" ["w"])
;   (vim.api.nvim_command "call neomake#configure#automake(\"w\")"))
