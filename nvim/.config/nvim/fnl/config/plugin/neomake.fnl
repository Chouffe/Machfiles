(module config.plugin.neomake
  {autoload {nvim aniseed.nvim}})

(defn config []
  (set nvim.g.neomake_open_list 0)
  (set nvim.g.neomake_highlight_lines 1)
  (vim.api.nvim_call_function "neomake#configure#automake" ["inw" 500]))
