(module config.lsp.rust
  {autoload {nvim aniseed.nvim
             lsp-common config.lsp.common
             util lspconfig/util}})

(def settings
  {:on_attach
     (lsp-common.make-on-attach-handler
       {:document-formatting-on-save? true
        :highlight-reference-when-idle? true})
   :handlers (lsp-common.make-handlers)
   :capabilites (lsp-common.make-capabilites)
   :root_dir (util.root_pattern ".git")
   :flags {:debounce_text_changes 150}})
