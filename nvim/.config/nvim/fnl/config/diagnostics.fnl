(fn setup []
  (let [signs {:Error "" :Warn "" :Info "" :Hint "󰌵"}]
    (each [error-type icon (pairs signs)]
      (let [hl (.. "DiagnosticSign" error-type)]
        (vim.fn.sign_define hl {:text icon :texthl hl :numhl hl}))))
  (vim.diagnostic.config
    {:signs
     {:text
      {[vim.diagnostic.severity.ERROR] ""
       [vim.diagnostic.severity.WARN] ""
       [vim.diagnostic.severity.INFO] ""
       [vim.diagnostic.severity.HINT] "󰌵"}}}))

{: setup}
