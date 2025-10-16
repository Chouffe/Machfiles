(fn register-keybindings [bufnr]
  (let [which-key (require :which-key)
        t (require :telescope.builtin)]
    (which-key.add
      [{1 :gq 2 vim.lsp.buf.range_formatting :buffer bufnr :desc "format selection" :mode [:v]}
       {1 :K 2 vim.lsp.buf.hover :desc "show documentation" :buffer bufnr}
       {1 :gd 2 vim.lsp.buf.definition :desc "jump to definition" :buffer bufnr}
       {1 :gi 2 vim.lsp.buf.implementation :desc "jump to implementation" :buffer bufnr}
       {1 "[d " 2 vim.diagnostic.goto_prev :desc "previous diagnostic" :buffer bufnr}
       {1 "]d" 2 vim.diagnostic.goto_next :desc "next diagnostic" :buffer bufnr}
       {1 (.. :<LocalLeader> :x) :group "transform" :buffer bufnr :mode [:v]}
       {1 (.. :<LocalLeader> :x :x) 2 vim.lsp.buf.code_action :desc "code action" :buffer bufnr :mode [:v]}
       {1 (.. :<LocalLeader> :b) :group "buffer lsp" :buffer bufnr}
       {1 (.. :<LocalLeader> :b :=) 2 vim.lsp.buf.format :desc "format" :buffer bufnr}
       {1 (.. :<LocalLeader> :b :d) 2 vim.diagnostic.set_loclist :desc "list diagnostics" :buffer bufnr}
       {1 (.. :<LocalLeader> :f) :group "find lsp" :buffer bufnr}
       {1 (.. :<LocalLeader> :f :d) 2 t.diagnostics :desc "diagnostics" :buffer bufnr}
       {1 (.. :<LocalLeader> :f :r) 2 t.lsp_references :desc "references" :buffer bufnr}
       {1 (.. :<LocalLeader> :f :s) 2 t.lsp_document_symbols :desc "document symbols" :buffer bufnr}
       {1 (.. :<LocalLeader> :f :S) 2 t.lsp_workspace_symbols :desc "workspace symbols" :buffer bufnr}
       {1 (.. :<LocalLeader> :v) :group "view lsp" :buffer bufnr}
       {1 (.. :<LocalLeader> :v :h) 2 vim.lsp.buf.signature_help :desc "signature help" :buffer bufnr}
       {1 (.. :<LocalLeader> :x) :group "transform" :buffer bufnr}
       {1 (.. :<LocalLeader> :x :a) 2 vim.lsp.buf.code_action :desc "code action" :buffer bufnr}
       {1 (.. :<LocalLeader> :x :x) 2 vim.lsp.buf.code_action :desc "code action" :buffer bufnr}
       {1 (.. :<LocalLeader> :x :f) 2 #(vim.lsp.buf.format {:async true})  :desc "format buffer" :buffer bufnr}
       {1 (.. :<LocalLeader> :x :r) 2 vim.lsp.buf.rename :desc "rename symbol" :buffer bufnr}])))

(fn format-on-save-autocommand [bufnr]
  (let [group-name (string.format "lsp_format_%d" bufnr)
        group-id (vim.api.nvim_create_augroup group-name {})
        timeout-ms 5000]
    (vim.api.nvim_create_autocmd :BufWritePre
                                 {:group group-id
                                  :pattern :<buffer>
                                  :callback #(vim.lsp.buf.format nil timeout-ms)
                                  :desc "Formats on save with LSP"})))

;; Here is how to fix the gq issue with null-ls
;; null-ls messes with formatexpr for some reason, which messes up `gq`
;; https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1131

(fn make-on-attach-handler [{: document-formatting-on-save? : force?}]
  (fn [client bufnr]
    (when (or (and document-formatting-on-save?
                   client.server_capabilities.documentFormattingProvider)
              (and document-formatting-on-save? force?))
      (format-on-save-autocommand bufnr))))

(fn disable-lsp-watcher []
  (print "Disabling lsp Watcher")
  (let [(ok wf) (pcall require :vim.lsp._watchfiles)]
    (if ok
        (tset wf :_watchfunc (fn [] (fn []))))))

(fn config []
  (let [mason-lspconfig (require :mason-lspconfig)
        nvim (require :aniseed.nvim)
        lspconfig (require :lspconfig)]
    (mason-lspconfig.setup {:ensure_installed [:pyright
                                               :bashls
                                               :ts_ls
                                               ; Python
                                               :ruff
                                               ; :jinja_lsp
                                               :clojure_lsp
                                               :dockerls
                                               :docker_compose_language_service
                                               :yamlls
                                               :html
                                               :lua_ls
                                               :fennel_language_server]})
    ;; Register the keybindings
    (vim.api.nvim_create_autocmd :LspAttach
                                 {:group (vim.api.nvim_create_augroup :UserLspConfig
                                                                      {})
                                  :callback (fn [ev]
                                              (let [bufnr ev.buf]
                                                ;; Set omnicompletion with LSP
                                                (nvim.buf_set_option bufnr
                                                                     :omnifunc
                                                                     "v:lua.vim.lsp.omnifunc")
                                                ;; Register keybindings
                                                (register-keybindings bufnr)))})
    ;; Enable all the following LSP servers with their associated configs
    (let [lsps [{:lsp :pyright :config {}}
                {:lsp :ruff :config {}}
                {:lsp :terraformls :config {}}
                {:lsp :dockerls :config {}}
                {:lsp :ts_ls :config {}}
                {:lsp :lua_ls :config {}}
                {:lsp :fennel_language_server :config {}}
                {:lsp :clojure_lsp :config {}}
                {:lsp :htmls :config {}}
                {:lsp :yamlls :config {}}
                {:lsp :bashls :config {}}]]
      (each [_ {: lsp : config} (ipairs lsps)]
        ;; Enable the LSP
        (vim.lsp.enable lsp)
        ;; Customize a LSP config
        (vim.lsp.config lsp config)))))


    ;; customize a config
    ; (vim.lsp.config :pyright {})))

; (fn config []
;   (let [mason-lspconfig (require :mason-lspconfig)
;         lspconfig (require :lspconfig)
;         cmp-nvim-lsp (require :cmp_nvim_lsp)
;         capabilities (cmp-nvim-lsp.default_capabilities)
;         nvim (require :aniseed.nvim)]
;     (disable-lsp-watcher)
;     ;; Make sure some lsp servers are always installed
;     (mason-lspconfig.setup {:ensure_installed [:pyright
;                                                :bashls
;                                                :ts_ls
;                                                ; Python
;                                                :ruff
;                                                ; :jinja_lsp
;                                                :clojure_lsp
;                                                :dockerls
;                                                :docker_compose_language_service
;                                                :yamlls
;                                                :html
;                                                :lua_ls
;                                                :fennel_language_server]})
;     ;; Setting up the LSPs
;     ;; Using Ruff for import's organizer
;     ;; Ignore all files for analysis to exclusively use Ruff for linting
;     (lspconfig.pyright.setup {:settings {:pyright {:disableOrganizeImports true} :python {:analysis {:ignore ["*"]}}}
;                               :on_attach (make-on-attach-handler {:force? false
;                                                                   :document-formatting-on-save? false})
;                               : capabilities})
;     ; (lspconfig.ruff.setup {:on_attach (make-on-attach-handler {:force? false
;     ;                                                            :document-formatting-on-save? false})
;     ;                        : capabilities})
;     ;; Terraform
;     (lspconfig.terraformls.setup {:on_attach (make-on-attach-handler {:force? true
;                                                                       :document-formatting-on-save? true})
;                                   : capabilities})
;     (lspconfig.ts_ls.setup {:on_attach (make-on-attach-handler {:force? true
;                                                                 :document-formatting-on-save? true})
;                             : capabilities})
;     ;; Docker
;     (lspconfig.dockerls.setup {:on_attach (make-on-attach-handler {:force? true
;                                                                    :document-formatting-on-save? true})
;                                : capabilities})
;     (lspconfig.docker_compose_language_service.setup {:on_attach (make-on-attach-handler {:force? true
;                                                                                           :document-formatting-on-save? true})
;                                                       : capabilities})
;     ; (lspconfig.jinja_lsp.setup {:on_attach (make-on-attach-handler {:force? true
;     ;                                                                 :document-formatting-on-save? true})
;     ;                             : capabilities})
;     ; (lspconfig.ts_ls.setup {:on_attach (make-on-attach-handler {:force? true
;     ;                                                             :document-formatting-on-save? true})
;     ;                         : capabilities})
;     (lspconfig.lua_ls.setup {: capabilities
;                              :settings {:Lua {:diagnostics {:globals [:vim]}}}})
;     (lspconfig.fennel_language_server.setup {: capabilities
;                                              :on_attach (make-on-attach-handler {:force? true
;                                                                                  :document-formatting-on-save? true})
;                                              :filetypes [:fennel]
;                                              :root_dir (lspconfig.util.root_pattern :fnl
;                                                                                     :lua)
;                                              :single_file_support true
;                                              :settings {:fennel {:diagnostics {:globals [:vim
;                                                                                          :jit
;                                                                                          :comment]}
;                                                                  :workspace {:library (vim.api.nvim_list_runtime_paths)}}}})
;     (lspconfig.clojure_lsp.setup {:on_attach (make-on-attach-handler {:document-formatting-on-save? true})
;                                   : capabilities
;                                   :root_dir (lspconfig.util.root_pattern :.git)})
;     (lspconfig.html.setup {: capabilities})
;     (lspconfig.yamlls.setup {:on_attach (make-on-attach-handler {:force? true
;                                                                  :document-formatting-on-save? true})
;                              : capabilities})
;     ; (lspconfig.bashls.setup {:on_attach (make-on-attach-handler {:force? true
;     ;                                                              :document-formatting-on-save? true})
;     ;                          : capabilities})
;     ;; TODO: setup default config from here: https://github.com/neovim/nvim-lspconfig
;     ;; TODO setup global mappings too
;     (vim.api.nvim_create_autocmd :LspAttach
;                                  {:group (vim.api.nvim_create_augroup :UserLspConfig
;                                                                       {})
;                                   :callback (fn [ev]
;                                               (let [bufnr ev.buf]
;                                                 ;; Set omnicompletion with LSP
;                                                 (nvim.buf_set_option bufnr
;                                                                      :omnifunc
;                                                                      "v:lua.vim.lsp.omnifunc")
;                                                 ;; Register keybindings
;                                                 (register-keybindings bufnr)))})))

{: config : register-keybindings}
