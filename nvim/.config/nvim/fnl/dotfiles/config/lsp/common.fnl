(module dotfiles.config.lsp.common
  {autoload {nvim aniseed.nvim
             lsp lspconfig
             util lspconfig/util
             configs lspconfig.configs}
   require-macros [dotfiles.macros]})

(defn- augroup-highlight []
  (augroup :lsp_highlight
    (autocmd :CursorHold "<buffer>" "lua vim.lsp.buf.document_highlight()")
    (autocmd :CursorHoldI "<buffer>" "lua" "vim.lsp.buf.document_highlight()")
    (autocmd :CursorMoved "<buffer>" "lua" "vim.lsp.buf.clear_references()")))

(defn- augroup-format []
  (augroup :lsp_format
    (autocmd :BufWritePre "<buffer>" "lua vim.lsp.buf.formatting_sync(nil, 1000)")))

(defn on-attach [client bufnr]
  (let [opts {:noremap true :silent true}
        nmap! (fn [mapping target] (nvim.buf_set_keymap bufnr :n mapping target opts))
        option! (fn [name value] (nvim.buf_set_option bufnr name value))]

    ;; Enable completion triggered by <c-x><c-o>
    (option! "omnifunc" "v:lua.vim.lsp.omnifunc")
    (nmap! :gD "<Cmd>lua vim.lsp.buf.declaration()<CR>")
    (nmap! :gd "<Cmd>lua vim.lsp.buf.definition()<CR>")
    (nmap! :K "<Cmd>lua vim.lsp.buf.hover()<CR>")
    (nmap! :<space>rn "<Cmd>lua vim.lsp.buf.rename()<CR>")
    (nmap! :<space>ca "<Cmd>lua vim.lsp.buf.code_action()<CR>")
    (nmap! :gr "<Cmd>lua vim.lsp.buf.references()<CR>")

    ;; Enable formatting and highlighting capabilities
    (when client.resolved_capabilities.document_formatting
      (augroup-format))
    (when client.resolved_capabilities.document_highlight
      (augroup-highlight))))

(defn update-colorscheme []
 (set nvim.o.updatetime 1000) ;; Useful for the HoldCursor and HoldCursorI
 (nvim.ex.highlight :link :LspReferenceText :Search)
 (nvim.ex.highlight :link :LspReferenceRead :LspReferenceText)
 (nvim.ex.highlight :link :LspReferenceWrite :LspReferenceText))

(update-colorscheme)
