(module config.plugin.black)

(defn config []
  (let [group-name :black_config
        group-id (vim.api.nvim_create_augroup group-name {})]
    (vim.api.nvim_create_autocmd
      :BufWritePre
      {:pattern "*.py"
       :group group-id
       :callback (fn [_]
                   (when (not= 0 (vim.fn.exists ":Black"))
                     (vim.fn.execute ":Black")))
       :desc "Runs Black on save"})))
