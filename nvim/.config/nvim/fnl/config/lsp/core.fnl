(fn nmap [function label opts]
  (let [a (require :aniseed.core)]
    (a.merge [function label] opts)))

(fn register-keybindings [bufnr]
  (let [which-key (require :which-key)
        t (require :telescope.builtin)]
    (which-key.register
      {:gq ["<Cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>" "Format selection"]}
      {:buffer bufnr :mode "v"})

  ;; TODO: fix the setup here
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
          :r (nmap vim.lsp.buf.rename "Rename symbol")
          :x (nmap t.lsp_code_actions "Code action")}}
     {:prefix "<LocalLeader>" :buffer bufnr})))

(fn config []
  (let [mason-lspconfig (require :mason-lspconfig)
        lspconfig (require :lspconfig)
        nvim (require :aniseed.nvim)]
    (mason-lspconfig.setup
      {:ensure_installed [:pyright
                          :bashls
                          :clojure_lsp
                          :yamlls
                          :html
                          :lua_ls 
                          :fennel_language_server]})
    (lspconfig.pyright.setup {})
    (lspconfig.lua_ls.setup 
      {:settings {:Lua {:diagnostics {:globals [:vim]}}}})
    (lspconfig.fennel_language_server.setup
      {:filetypes [:fennel]
       :root_dir (lspconfig.util.root_pattern :fnl :lua)
       :single_file_support true
       :settings {:fennel {:diagnostics {:globals [:vim :jit :comment]}
                           :workspace {:library (vim.api.nvim_list_runtime_paths)}}}})
    (lspconfig.clojure_lsp.setup {})
    (lspconfig.html.setup {})
    (lspconfig.yamlls.setup {})
    (lspconfig.bashls.setup {})

  ;; TODO: setup default config from here: https://github.com/neovim/nvim-lspconfig

  ;; TODO setup global mappings too
   (vim.api.nvim_create_autocmd 
     :LspAttach 
     {:group (vim.api.nvim_create_augroup :UserLspConfig {})
      :callback (fn [ev]
                  (let [bufnr ev.buf]
                    ; (print (vim.inspect ev))
                    ;; Set omnicompletion with LSP
                    (nvim.buf_set_option bufnr :omnifunc :v:lua.vim.lsp.omnifunc)
                    ;; Register keybindings
                    (register-keybindings bufnr)))})))

{: config 
 : register-keybindings}
