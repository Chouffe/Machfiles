(module config.plugin.black)

(defn config []
  (let [group-name :black_config
        group-id (vim.api.nvim_create_augroup group-name {})]
    (vim.api.nvim_create_autocmd
      :BufWritePre
      {:group group-id
       :pattern "*py"
       :callback (fn [_]
                   (when (not= 0 (vim.fn.exists ":Black"))
                     (vim.fn.execute ":Black")))
       :desc "Calls Black on save"})))
