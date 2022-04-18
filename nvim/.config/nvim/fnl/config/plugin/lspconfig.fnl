(module config.plugin.lspconfig
  {autoload {lsp-clojure config.lsp.clojure
             lsp-lua config.lsp.lua
             lsp-common config.lsp.common
             nvim-lsp-installer nvim-lsp-installer
             lspkind lspkind}})

(defn config []
  (lsp-common.define-signs "LspDiagnostics")
  (nvim-lsp-installer.on_server_ready
    (fn [server]
      (let [server-name (. server :name)
            setup (. server :setup)]
        (if
          (= "sumneko_lua" server-name)
          (setup server lsp-lua.settings)

          (= "clojure_lsp" server-name)
          (setup server lsp-clojure.settings)

          (= "pyright" server-name)
          (setup server {})

          (print (.. "[nvim-lsp-installer] Not handled with exta settings: " server-name)))))))
