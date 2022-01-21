(module config.lsp.clojure
  {autoload {a aniseed.core
             nvim aniseed.nvim
             lsp-common config.lsp.common
             lsp lspconfig
             util lspconfig/util}})

(defn config []
  (if (= (nvim.fn.has "nvim-0.6") 1)
    (lsp-common.define-signs "Diagnostic")
    (lsp-common.define-signs "LspDiagnostics"))
  (lsp.clojure_lsp.setup
    {:on_attach
     (lsp-common.make-on-attach-handler
       {:document-formatting-on-save? true
        :highlight-reference-when-idle? true})
     :handlers (lsp-common.make-handlers)
     :capabilites (lsp-common.make-capabilites)
     :root_dir (util.root_pattern ".git")
     :flags {:debounce_text_changes 150}}))
