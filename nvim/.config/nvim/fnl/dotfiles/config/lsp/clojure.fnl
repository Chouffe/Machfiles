(module dotfiles.config.lsp.clojure
  {autoload {lsp-common dotfiles.config.lsp.common
             lsp lspconfig
             util lspconfig/util}})

(lsp.clojure_lsp.setup
  {:on_attach lsp-common.on-attach
   :root_dir (util.root_pattern ".git")
   :flags {:debounce_text_changes 150}})
