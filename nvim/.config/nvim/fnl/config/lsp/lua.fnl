(module config.lsp.lua
  {autoload {nvim aniseed.nvim
             lsp-common config.lsp.common
             lspconfig lspconfig}})

(def settings
  (let [runtime-path (vim.split package.path ";")]
    (table.insert runtime-path "lua/?.lua")
    (table.insert runtime-path "lua/?init.lua")
    {:settings
     {:Lua
      {:runtime {:version "LuaJIT" ;; Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                 :path runtime-path}
       :diagnostics {:globals ["vim"]}
       :workspace {:library (nvim.get_runtime_file "" true)}
       :telemetry {:enable false}}}
     :on_attach
     (lsp-common.make-on-attach-handler
       {:document-formatting-on-save? true
        :highlight-reference-when-idle? true})
     :handlers (lsp-common.make-handlers)
     :capabilites (lsp-common.make-capabilites)
     :flags {:debounce_text_changes 150}}))
