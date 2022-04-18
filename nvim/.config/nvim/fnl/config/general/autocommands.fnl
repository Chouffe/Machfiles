(module config.general.autocommands
  {autoload {functions config.general.functions}})

(defn setup []
  (let [group-id (vim.api.nvim_create_augroup :config_group {})]
    (vim.api.nvim_create_autocmd
      :BufWinLeave
      {:pattern "*"
       :group group-id
       :callback (fn [_] (vim.fn.clearmatches))
       :desc "Clears matches"})
    (vim.api.nvim_create_autocmd
      :BufWritePre
      {:pattern "*"
       :group group-id
       :callback functions.trim-whitespace
       :desc "Trims whitespace and empty end of buffer blank lines"})))
