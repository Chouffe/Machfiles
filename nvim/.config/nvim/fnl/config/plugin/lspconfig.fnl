(module config.plugin.lspconfig
  {autoload {lsp-clojure config.lsp.clojure}})

(defn setup []
  (lsp-clojure.setup))

(setup)
