(module config.lsp.common
  {autoload {a aniseed.core
             configs lspconfig.configs
             cmplsp cmp_nvim_lsp
             lsp lspconfig
             nvim aniseed.nvim
             util lspconfig/util}
   require-macros [config.macros]})

(defn define-signs
  [prefix]
  "symbols to show for lsp diagnostics"
  (let [error (.. prefix "SignError")
        warn  (.. prefix "SignWarn")
        info  (.. prefix "SignInfo")
        hint  (.. prefix "SignHint")]
   (vim.fn.sign_define error {:text "x" :texthl error})
   (vim.fn.sign_define warn  {:text "!" :texthl warn})
   (vim.fn.sign_define info  {:text "i" :texthl info})
   (vim.fn.sign_define hint  {:text "?" :texthl hint})))

(defn- update-colorscheme []
 (set nvim.o.updatetime 1000) ;; Useful for the HoldCursor and HoldCursorI
 (nvim.ex.highlight! :link :LspReferenceText :Search)
 (nvim.ex.highlight! :link :LspReferenceRead :LspReferenceText)
 (nvim.ex.highlight! :link :LspReferenceWrite :LspReferenceText))

(defn- highlight-reference-when-idle
  [bufnr]
  ;; TODO: make it an autocmd with :ColorScheme event
  (update-colorscheme)
  (augroup (string.format "lsp_highlight_%d" bufnr)
    (autocmd :CursorHold  "<buffer>" "lua vim.lsp.buf.document_highlight()")
    (autocmd :CursorHoldI "<buffer>" "lua" "vim.lsp.buf.document_highlight()")
    (autocmd :CursorMoved "<buffer>" "lua" "vim.lsp.buf.clear_references()")))

(defn- format-on-save
  [bufnr]
  (augroup (string.format "lsp_format_%d" bufnr)
    (autocmd :BufWritePre "<buffer>" "lua vim.lsp.buf.formatting_sync(nil, 1000)")))

(defn make-handlers []
  {"textDocument/publishDiagnostics"
   (vim.lsp.with
     vim.lsp.diagnostic.on_publish_diagnostics
     {:severity_sort true
      :update_in_insert false
      :underline true
      :virtual_text false})
   "textDocument/hover"
   (vim.lsp.with
     vim.lsp.handlers.hover
     {:border "single"})
   "textDocument/signatureHelp"
   (vim.lsp.with
     vim.lsp.handlers.signature_help
     {:border "single"})})

(defn make-capabilites []
  (cmplsp.update_capabilities (vim.lsp.protocol.make_client_capabilities)))

(defn make-on-attach-handler
  [{: document-formatting-on-save? : highlight-reference-when-idle?}]
  (fn on-attach [client bufnr]
    (let [opts {:noremap true}
          nmap (fn [mapping target] (nvim.buf_set_keymap bufnr :n mapping target opts))
          vmap (fn [mapping target] (nvim.buf_set_keymap bufnr :v mapping target opts))
          option (fn [name value] (nvim.buf_set_option bufnr name value))]

      ;; Set omnicompletion with LSP
      (option :omnifunc :v:lua.vim.lsp.omnifunc)

      (nmap :gd              "<Cmd>lua vim.lsp.buf.definition()<CR>")
      (nmap :K               "<Cmd>lua vim.lsp.buf.hover()<CR>")
      (nmap :<localleader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>")
      (nmap :<localleader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>")
      (nmap :<localleader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>")
      (nmap :<localleader>ln "<cmd>lua vim.lsp.buf.rename()<CR>")
      (nmap :<localleader>le "<cmd>lua vim.diagnostic.open_float()<CR>")
      (nmap :<localleader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>")
      (nmap :<localleader>lf "<cmd>lua vim.lsp.buf.formatting()<CR>")
      (nmap :<localleader>lj "<cmd>lua vim.diagnostic.goto_next()<CR>")
      (nmap :<localleader>lk "<cmd>lua vim.diagnostic.goto_prev()<CR>")

      ; Fzf
      ; (nmap :<localleader>la ":FzfLua lsp_code_actions<CR>")
      ; (nmap :<localleader>lw ":FzfLua lsp_workspace_diagnostics<CR>")
      ; (nmap :<localleader>lr ":FzfLua lsp_references<CR>")

      ; Telescope
      (nmap :<localleader>la ":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>")
      (vmap :<localleader>la ":'<,'>:Telescope lsp_range_code_actions theme=cursor<cr>")
      (nmap :<localleader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>")
      (nmap :<localleader>lr ":lua require('telescope.builtin').lsp_references()<cr>")
      (nmap :<localleader>li ":lua require('telescope.builtin').lsp_implementations()<cr>"))

      ;; Enable formatting and highlighting capabilities
    (when (and document-formatting-on-save?
               client.resolved_capabilities.document_formatting)
      (format-on-save bufnr))

    (when (and highlight-reference-when-idle?
               client.resolved_capabilities.document_highlight)
      (highlight-reference-when-idle bufnr))))
