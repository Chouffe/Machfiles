(module dotfiles.general.lspconfig
  {autoload {nvim conjure.aniseed.nvim}})

;; Update colorscheme for LSP
(set nvim.o.updatetime 1500) ;; Useful for the HoldCursor and HoldCursorI
(nvim.ex.highlight :link :LspReferenceText :Visual)
(nvim.ex.highlight :link :LspReferenceRead :LspReferenceText)
(nvim.ex.highlight :link :LspReferenceWrite :LspReferenceText)
