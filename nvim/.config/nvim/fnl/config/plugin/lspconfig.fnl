(module config.plugin.lspconfig
  {autoload {lsp-clojure config.lsp.clojure
             lsp-lua config.lsp.lua
             lspkind lspkind}})

(defn config []
  (lsp-clojure.config)
  (lsp-lua.config)
  (lspkind.init))
