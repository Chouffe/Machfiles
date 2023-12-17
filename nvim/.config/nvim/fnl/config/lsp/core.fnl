(fn nmap [function label opts]
  (let [a (require :aniseed.core)]
    (a.merge [function label] opts)))

(fn register-keybindings [bufnr]
  (let [which-key (require :which-key)
        t (require :telescope.builtin)]
    (which-key.register
      {:gq (nmap vim.lsp.buf.range_formatting "Format selection")}
      {:buffer bufnr :mode "v"})

    (which-key.register
      {:K (nmap vim.lsp.buf.hover "Show documentation")
       :gd (nmap vim.lsp.buf.definition "Jump to definition")
       :gi (nmap vim.lsp.buf.implementation "Jump to implementation")
       "[" {:d (nmap vim.diagnostic.goto_prev "Previous diagnostic")}
       "]" {:d (nmap vim.diagnostic.goto_next "Next diagnostic")}}
      {:buffer bufnr})

    (which-key.register
      {:x {:name "transform"
           :x (nmap vim.lsp.buf.code_action "Code action")}}
      {:prefix "<LocalLeader>" :buffer bufnr :mode "v"})

   (which-key.register
     {:b {:name "buffer"
          := (nmap vim.lsp.buf.format "Format buffer")
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
          :a (nmap vim.lsp.buf.code_action "Code action")
          :x (nmap vim.lsp.buf.code_action "Code action")
          :f (nmap (fn [] (vim.lsp.buf.format {:async true})) "Format buffer")
          :r (nmap vim.lsp.buf.rename "Rename symbol")}}
     {:prefix "<LocalLeader>" :buffer bufnr})))

(fn format-on-save-autocommand
  [bufnr]
  (let [group-name (string.format "lsp_format_%d" bufnr)
        group-id (vim.api.nvim_create_augroup group-name {})]
    (vim.api.nvim_create_autocmd
      :BufWritePre
      {:group group-id
       :pattern "<buffer>"
       ; :callback (fn [_] (vim.lsp.buf.formatting_sync nil 1000))
       :callback (fn [_] (vim.lsp.buf.format nil 1000))
       :desc "Formats on save with LSP"})))

(fn make-on-attach-handler 
  [{: document-formatting-on-save? : force?}]
  (fn [client bufnr]
    (when (or (and document-formatting-on-save?
                  client.server_capabilities.documentFormattingProvider)
              (and document-formatting-on-save? force?))
      (format-on-save-autocommand bufnr))))
    
(fn config []
  (let [mason-lspconfig (require :mason-lspconfig)
        lspconfig (require :lspconfig)
        cmp-nvim-lsp (require :cmp_nvim_lsp)
        capabilities (cmp-nvim-lsp.default_capabilities)
        nvim (require :aniseed.nvim)]

    ;; Make sure some lsp servers are always installed
    (mason-lspconfig.setup
      {:ensure_installed [:pyright
                          :bashls
                          :clojure_lsp
                          :yamlls
                          :html
                          :lua_ls 
                          :fennel_language_server]})

    ;; Setting up the LSPs
    (lspconfig.pyright.setup 
      {:on_attach (make-on-attach-handler {:force? true 
                                           :document-formatting-on-save? true})
       :capabilities capabilities})
    (lspconfig.lua_ls.setup 
      {:capabilities capabilities
       :settings {:Lua {:diagnostics {:globals [:vim]}}}})
    (lspconfig.fennel_language_server.setup
      {:capabilities capabilities
       :filetypes [:fennel]
       :root_dir (lspconfig.util.root_pattern :fnl :lua)
       :single_file_support true
       :settings {:fennel {:diagnostics {:globals [:vim :jit :comment]}
                           :workspace {:library (vim.api.nvim_list_runtime_paths)}}}})
    (lspconfig.clojure_lsp.setup 
      {:on_attach 
       (make-on-attach-handler {:document-formatting-on-save? true})
       :capabilities capabilities
       :root_dir (lspconfig.util.root_pattern ".git")})
    (lspconfig.html.setup 
      {:capabilities capabilities})
    (lspconfig.yamlls.setup 
      {:capabilities capabilities})
    (lspconfig.bashls.setup 
      {:on_attach (make-on-attach-handler {:force? true 
                                           :document-formatting-on-save? true})
       :capabilities capabilities})

  ;; TODO: setup default config from here: https://github.com/neovim/nvim-lspconfig

  ;; TODO setup global mappings too
   (vim.api.nvim_create_autocmd 
     :LspAttach 
     {:group (vim.api.nvim_create_augroup :UserLspConfig {})
      :callback (fn [ev]
                  (let [bufnr ev.buf]
                    ;; Set omnicompletion with LSP
                    (nvim.buf_set_option bufnr :omnifunc :v:lua.vim.lsp.omnifunc)
                    ;; Register keybindings
                    (register-keybindings bufnr)))})))

{: config 
 : register-keybindings}
