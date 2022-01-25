(module config.plugin.lspconfig
  {autoload {lsp-clojure config.lsp.clojure
             lspkind lspkind}})

(defn config []
  (lsp-clojure.config)
  (lspkind.init))
