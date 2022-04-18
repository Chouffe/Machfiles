(module config.plugin.neomake
  {autoload {nvim aniseed.nvim}})

;; This does not seem to be called for some reason
;; See viml script for setting up neomake
(defn config []
  (vim.api.nvim_call_function "neomake#configure#automake" ["inw"]))


; (comment
;   (vim.api.nvim_call_function "neomake#configure#automake" ["w"])
;   (vim.api.nvim_command "call neomake#configure#automake(\"w\")"))
