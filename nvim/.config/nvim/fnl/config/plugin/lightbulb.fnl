(fn config []
  (let [nvim-lightbulb (require :nvim-lightbulb)
        group-name :my_lightbulb_config
        group-id (vim.api.nvim_create_augroup group-name {})]
    (vim.api.nvim_create_autocmd
      :CursorHoldI
      {:group group-id
       :pattern "*"
       :callback (fn [_] (nvim-lightbulb.update_lightbulb))
       :desc "Updates lightbulb signs when cursor idle"})
    (vim.api.nvim_create_autocmd
      :CursorHold
      {:group group-id
       :pattern "*"
       :callback (fn [_] (nvim-lightbulb.update_lightbulb))
       :desc "Updates lightbulb signs when cursor idle"})))

{: config}
