(module config.lsp.common
  {autoload {a aniseed.core
             nvim aniseed.nvim
             lsp lspconfig
             cmplsp cmp_nvim_lsp
             lsp lspconfig
             util lspconfig/util
             configs lspconfig.configs}
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

(defn augroup-highlight 
  []
  (augroup :lsp_highlight
    (autocmd :CursorHold "<buffer>" "lua vim.lsp.buf.document_highlight()")
    (autocmd :CursorHoldI "<buffer>" "lua" "vim.lsp.buf.document_highlight()")
    (autocmd :CursorMoved "<buffer>" "lua" "vim.lsp.buf.clear_references()")))

(defn augroup-format []
  (augroup :lsp_format
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

(defn on-attach [client bufnr]
  (let [opts {:noremap true}
        nmap (fn [mapping target] (nvim.buf_set_keymap bufnr :n mapping target opts))
        vmap (fn [mapping target] (nvim.buf_set_keymap bufnr :v mapping target opts))]

    (nmap :gd         "<Cmd>lua vim.lsp.buf.definition()<CR>")
    (nmap :K          "<Cmd>lua vim.lsp.buf.hover()<CR>")
    (nmap :<leader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>")
    (nmap :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>")
    (nmap :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    (nmap :<leader>ln "<cmd>lua vim.lsp.buf.rename()<CR>")
    (nmap :<leader>le "<cmd>lua vim.diagnostic.open_float()<CR>")
    (nmap :<leader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>")
    (nmap :<leader>lf "<cmd>lua vim.lsp.buf.formatting()<CR>")
    (nmap :<leader>lj "<cmd>lua vim.diagnostic.goto_next()<CR>")
    (nmap :<leader>lk "<cmd>lua vim.diagnostic.goto_prev()<CR>")

    ; Telescope
    (nmap :<leader>la ":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>")
    (vmap :<leader>la ":'<,'>:Telescope lsp_range_code_actions theme=cursor<cr>")
    (nmap :<leader>lw ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>")
    (nmap :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>")
    (nmap :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>"))

  ;; Enable formatting and highlighting capabilities
  (when client.resolved_capabilities.document_formatting
    (augroup-format))

  (when client.resolved_capabilities.document_highlight
    (augroup-highlight)))

; (defn on-attach [client bufnr]
;   (let [opts {:noremap true :silent true}
;         nmap! (fn [mapping target] (nvim.buf_set_keymap bufnr :n mapping target opts))
;         option! (fn [name value] (nvim.buf_set_option bufnr name value))]

;     ;; Enable completion triggered by <c-x><c-o>
;     (option! "omnifunc" "v:lua.vim.lsp.omnifunc")
;     (nmap! :gD "<Cmd>lua vim.lsp.buf.declaration()<CR>")
;     (nmap! :gd "<Cmd>lua vim.lsp.buf.definition()<CR>")
;     (nmap! :K "<Cmd>lua vim.lsp.buf.hover()<CR>")
;     (nmap! :<space>rn "<Cmd>lua vim.lsp.buf.rename()<CR>")
;     (nmap! :<space>ca "<Cmd>lua vim.lsp.buf.code_action()<CR>")
;     (nmap! :gr "<Cmd>lua vim.lsp.buf.references()<CR>")

;     ;; Enable formatting and highlighting capabilities
;     (when client.resolved_capabilities.document_formatting
;       (augroup-format))
;     (when client.resolved_capabilities.document_highlight
;       (augroup-highlight))))

(defn update-colorscheme []
 (set nvim.o.updatetime 1000) ;; Useful for the HoldCursor and HoldCursorI
 (nvim.ex.highlight! :link :LspReferenceText :Search)
 (nvim.ex.highlight! :link :LspReferenceRead :LspReferenceText)
 (nvim.ex.highlight! :link :LspReferenceWrite :LspReferenceText))

; (update-colorscheme)
