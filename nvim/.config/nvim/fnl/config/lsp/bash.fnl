(module config.lsp.bash
  {autoload {nvim aniseed.nvim
             lsp-common config.lsp.common
             lspconfig lspconfig}})

(def settings
  {:on_attach
     (lsp-common.make-on-attach-handler
       {:document-formatting-on-save? true
        :highlight-reference-when-idle? true})
   :handlers (lsp-common.make-handlers)
   :capabilites (lsp-common.make-capabilites)
   :flags {:debounce_text_changes 150}})
