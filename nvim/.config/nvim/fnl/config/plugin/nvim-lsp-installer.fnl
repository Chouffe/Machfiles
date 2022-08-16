(module config.plugin.nvim-lsp-installer
  {autoload {lspconfig lspconfig
             lsp-bash config.lsp.bash
             lsp-clojure config.lsp.clojure
             lsp-rust config.lsp.rust
             lsp-common config.lsp.common
             lsp-lua config.lsp.lua
             lsp-python config.lsp.python
             nvim-lsp-installer nvim-lsp-installer}})

(defn config []
  (lsp-common.define-signs "LspDiagnostics")
  (nvim-lsp-installer.setup {})
  (lspconfig.clojure_lsp.setup lsp-clojure.settings)
  (lspconfig.sumneko_lua.setup lsp-lua.settings)
  (lspconfig.rust_analyzer.setup lsp-rust.settings)
  (lspconfig.pyright.setup lsp-python.settings)
  (lspconfig.bashls.setup lsp-bash.settings))
