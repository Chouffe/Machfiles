(module config.plugin.lspconfig
  {autoload {lsp-clojure config.lsp.clojure}})

(defn config []
  (lsp-clojure.config))
