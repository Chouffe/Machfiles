(module config.lsp.common
  {autoload {a aniseed.core
             configs lspconfig.configs
             cmplsp cmp_nvim_lsp
             t telescope.builtin
             lsp lspconfig
             nvim aniseed.nvim
             util lspconfig/util
             which-key which-key}})

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
  (update-colorscheme)
  (let [group-name (string.format "lsp_highlight_%d" bufnr)
        group-id (vim.api.nvim_create_augroup group-name {})]
    (vim.api.nvim_create_autocmd
      :CursorHold
      {:group group-id
       :pattern "<buffer>"
       :callback (fn [_] (vim.lsp.buf.document_highlight))
       :desc "Highlights document when idle for some time"})
    (vim.api.nvim_create_autocmd
      :CursorHoldI
      {:group group-id
       :pattern "<buffer>"
       :callback (fn [_] (vim.lsp.buf.document_highlight))
       :desc "Highlights document when idle for some time"})
    (vim.api.nvim_create_autocmd
      :CursorMoved
      {:group group-id
       :pattern "<buffer>"
       :callback (fn [_] (vim.lsp.buf.clear_references))
       :desc "Clears references once the cursor has moved"})))

(defn- format-on-save
  [bufnr]
  (let [group-name (string.format "lsp_format_%d" bufnr)
        group-id (vim.api.nvim_create_augroup group-name {})]
    (vim.api.nvim_create_autocmd
      :BufWritePre
      {:group group-id
       :pattern "<buffer>"
       :callback (fn [_] (vim.lsp.buf.formatting_sync nil 1000))
       :desc "Formats on save with LSP"})))

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
  (cmplsp.update_capabilities
    (vim.lsp.protocol.make_client_capabilities)))

(defn- nmap [function label opts]
  (a.merge [function label] opts))

(defn- register-keybindings [bufnr]
  (which-key.register
    {:gq ["<Cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>" "Format selection"]}
    {:buffer bufnr :mode "v"})

  (which-key.register
    {:K (nmap vim.lsp.buf.hover "Show documentation")
     :gd (nmap vim.lsp.buf.definition "Jump to definition")
     "[" {:d (nmap vim.diagnostic.goto_prev "Previous diagnostic")}
       "]" {:d (nmap vim.diagnostic.goto_next "Next diagnostic")}}
    {:buffer bufnr})

  (which-key.register
    {:x {:name "transform"
         :x ["<Cmd>lua require('telescope.builtin').lsp_code_actions()<CR><Esc>" "Code action"]}}
    {:prefix "<LocalLeader>" :buffer bufnr :mode "v"})

  (which-key.register
    {:b {:name "buffer"
         := (nmap vim.lsp.buf.formatting "Format buffer")
         :d (nmap vim.diagnostic.set_loclist "List diagnostics")}
     :f {:name "find"
         :d (nmap t.diagnostics "Diagnostics")
         :r (nmap t.lsp_references "References")
         :s (nmap t.lsp_document_symbols "Document symbols")
         :S (nmap t.lsp_workspace_symbols "Workspace symbols")}
     :v {:name "view"
         ; :d ["<Cmd>lua vim.diagnostic.open_float()<CR>" "View diagnostics"]
         :h (nmap vim.lsp.buf.signature_help "Signature help")}
     :x {:name "transform"
         :r (nmap vim.lsp.buf.rename "Rename symbol")
         :x (nmap t.lsp_code_actions "Code action")}}
    {:prefix "<LocalLeader>" :buffer bufnr}))

(defn make-on-attach-handler
  [{: document-formatting-on-save? : highlight-reference-when-idle?}]
  (fn on-attach [client bufnr]

    ;; Set omnicompletion with LSP
    (nvim.buf_set_option bufnr :omnifunc :v:lua.vim.lsp.omnifunc)
    (register-keybindings bufnr)

    ;; Enable formatting and highlighting capabilities
    (when (and document-formatting-on-save?
               client.resolved_capabilities.document_formatting)
      (format-on-save bufnr))

    (when (and highlight-reference-when-idle?
               client.resolved_capabilities.document_highlight)
      (highlight-reference-when-idle bufnr))

    (print (string.format "LSP ready. [%s]" (. client :name)))))
