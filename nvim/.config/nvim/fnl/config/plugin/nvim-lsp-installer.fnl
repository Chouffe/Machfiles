(module config.plugin.nvim-lsp-installer
  {autoload {lsp-bash config.lsp.bash
             lsp-clojure config.lsp.clojure
             lsp-common config.lsp.common
             lsp-lua config.lsp.lua
             lsp-python config.lsp.python
             nvim-lsp-installer nvim-lsp-installer}})

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
          (setup server lsp-python.settings)

          (= "bashls" server-name)
          (setup server lsp-bash.settings)

          (print (.. "[nvim-lsp-installer] Not handled with exta settings: " server-name)))))))
