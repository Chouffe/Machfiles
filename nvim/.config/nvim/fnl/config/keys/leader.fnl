(fn set-leader-keys [leader-key local-leader-key]
  (let [nvim (require :aniseed.nvim)]
    (set nvim.g.mapleader leader-key)
    (set nvim.g.maplocalleader local-leader-key)))

(fn register-neotest-keybindings [prefix]
  (let [neotest (require :neotest)
        which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :t) :group "test"}
       {1 (.. prefix :t :F) 2 #(neotest.run.run {1 "vim.fn.expand('%')" :strategy :dap}) :desc "debug file"}
       {1 (.. prefix :t :L) 2 #(neotest.run.run_last {:strategy :dap}) :desc "debug last"}
       {1 (.. prefix :t :a) 2 #(neotest.run.attach) :desc "attach"}
       {1 (.. prefix :t :f) 2 #(neotest.run.run {1 "vim.fn.expand('%')"}) :desc "file"}
       {1 (.. prefix :t :l) 2 #(neotest.run.run_last) :desc "last"}
       {1 (.. prefix :t :n) 2 #(neotest.run.run) :desc "nearest"}
       {1 (.. prefix :t :N) 2 #(neotest.run.run {:strategy :dap}) :desc "debug nearest"}
       {1 (.. prefix :t :o) 2 #(neotest.output.open {:enter true}) :desc "output"}
       {1 (.. prefix :t :s) 2 #(neotest.run.stop) :desc "stop"}
       {1 (.. prefix :t :S) 2 #(neotest.summary.toggle) :desc "summary"}])))

(fn register-trouble-keybindings [prefix]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :x) :group "trouble"}
       {1 (.. prefix :xx) 2 ":Trouble diagnostics toggle<cr>" :desc "global"}
       {1 (.. prefix :xX) 2 ":Trouble diagnostics toggle filter.buf=0<cr>" :desc "buffer"}
       {1 (.. prefix :xs) 2 ":Trouble symbols toggle focus=false<cr>" :desc "symbols"}
       {1 (.. prefix :xq) 2 ":Trouble qflist toggle<cr>" :desc "quickfix"}
       {1 (.. prefix :xl) 2 ":Trouble loclist toggle<cr>" :desc "loclist"}
       {1 (.. prefix :xr) 2 ":Trouble lsp toggle focus=false win.position=right<cr>" :desc "lsp"}])))

    ; (which-key.register
    ;   {:x {:name "trouble"
    ;        :x [":Trouble diagnostics toggle<cr>" "Diagnostics (Trouble) "]
    ;        :X [":Trouble diagnostics toggle filter.buf=0<cr>" "Buffer Diagnostics (Trouble) "]
    ;        :s [":Trouble symbols toggle focus=false<cr>" "Symbols (Trouble)"]
    ;        :q [":Trouble qflist toggle<cr>" "Quickfix List (Trouble) "]
    ;        :l [":Trouble loclist toggle<cr>" "Location List (Trouble) "]
    ;        :r [":Trouble lsp toggle focus=false win.position=right<cr>" "LSP Definitions / references / ... (Trouble)"]}}
    ;   {:prefix prefix})))

(fn register-buffer-keybindings [prefix]
  (let [which-key (require :which-key)
        functions (require :config.general.functions)
        t (require :telescope.builtin)]
    (which-key.add
      [{1 (.. prefix :b) :group "buffer"}
       {1 (.. prefix :b :d) 2 functions.delete_buffer :desc "delete"}
       {1 (.. prefix :b :l) 2 t.buffers :desc "list"}
       {1 (.. prefix :b :n) 2 ":bnext<CR>" :desc "next"}
       {1 (.. prefix :b :o) 2 ":only<CR>" :desc "only"}
       {1 (.. prefix :b :p) 2 ":bprevious<CR>" :desc "previous"}
       {1 (.. prefix :b :w) 2 ":w<CR>" :desc "write"}])))
    ; (which-key.register
    ;   {:b {:name "buffer"
    ;        :d [functions.delete_buffer "delete"]
    ;        :l [t.buffers "list"]
    ;        :n [":bnext<CR>" "next"]
    ;        :o [":only<CR>" "only"]
    ;        :p [":bprevious<CR>" "previous"]
    ;        :w [":w<CR>" "write|save"]}}
    ;   {:prefix prefix})))

(fn register-window-keybindings [prefix]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :w) :group "window"}
       {1 (.. prefix :w :o) 2 ":only<CR>" :desc "only"}
       {1 (.. prefix :w :w) 2 ":w<CR>" :desc "write"}
       {1 (.. prefix :w :q) 2 ":q<CR>" :desc "quit"}
       {1 (.. prefix :j) 2 ":split<CR>" :desc "horizontal split"}
       {1 (.. prefix :k) 2 ":vsplit<CR>" :desc "vertical split"}])))
    ; (which-key.register
    ;   {:w {:name "window"
    ;        :o [":only<CR>" "only"]
    ;        :w [":w<CR>" "write|save"]
    ;        :q [":q<CR>" "quit"]}
    ;    :j [":split<CR>" "horizontal split"]
    ;    :k [":vsplit<CR>" "vertical split"]}
    ;   {:prefix prefix})))

(fn register-formatting-keybindings [prefix]
  (let [which-key (require :which-key)]
    (which-key.register
      {:F {:name "format"
           :e [":%!jet --pretty<CR>" "Format edn"]
           :j [":%!jq --sort-keys<CR>" "Format json"]}}
      {:prefix prefix})
    (which-key.register
      {:F {:name "format"
           :j [":!jq --sort-keys<CR>" "Format json"]
           :e [":!jet --pretty<CR>" "Format edn"]}}
      {:prefix prefix :mode :v})))

(fn register-git-keybindings [prefix]
  (let [which-key (require :which-key)]
    (which-key.register
      {:g {:name "git"
           :n [":Neogit<cr>" "Neogit"]
           :b [":Git blame<CR>" "blame"]
           :c [":Git commit<CR>" "commit"]
           :d {:name "conflict resolution"
               :s [":Gvdiffsplit!<CR>" "diff split"]
               :h [":diffget //2<CR>" "get left"]
               :l [":diffget //3<CR>" "get right"]}
           :g {:name "sync"
               :p [":Git push<CR>" "push"]
               :l [":Git pull<CR>" "pull"]}
           :s [":Git<CR>" "status"]}}
      {:prefix prefix})))

(fn register-location-list-keybindings [prefix]
  (let [which-key (require :which-key)]
    (which-key.register
      {:l {:name "location list"
           :l [":lopen<CR>" "open"]
           :n [":lnext<CR>" "next"]
           :o [":lopen<CR>" "open"]
           :p [":lprev<CR>" "previous"]
           :x [":lclose<CR>" "close"]}}
      {:prefix prefix})))

(fn register-quickfix-keybindings [prefix]
  (let [which-key (require :which-key)]
    (which-key.register
      {:c {:name "quickfix list"
           :c [":copen<CR>" "open"]
           :n [":cnext<CR>" "next"]
           :o [":copen<CR>" "open"]
           :p [":cprev<CR>" "previous"]
           :x [":cclose<CR>" "close"]}}
      {:prefix prefix})))

(fn register-misc-keybindings [prefix]
  (let [which-key (require :which-key)
        legendary (require :legendary)]
    (which-key.register
      {:h {:name "highlight"
           :c [":ToggleHiglightAtColorColumn<CR>" "toggle highlight at column"]
           :x [":nohlsearch<CR>" "search highlighting off"]}
       :n [":set number!<CR>" "toggle number"]
       :o [legendary.find "Legendary"]
       :p [":set paste!<CR>\"+p :set paste!<CR>" "paste from clipboard"]
       :s [":set spell!<CR>" "toggle spell"]
       :t {:name "NvimTree"
           :r [":<C-u>NvimTreeFindFileToggle<CR>" "find file toggle"]
           :t [":<C-u>NvimTreeToggle<CR>" "toggle"]}
       :y ["\"+y" "copy into clipboard"]}
      {:prefix prefix})

    (which-key.register
      {:y ["\"+yy" "copy into clipboard"]}
      {:prefix prefix :mode :v})

    (which-key.register
      {:gcc "toggle comment"}
      {})))

(fn register-parinfer-keybindings [prefix]
  (let [which-key (require :which-key)]
    (which-key.register
      {:p {:name "parinfer"
           :p [":ParinferToggle<CR>" "toggle"]}}
      {:prefix prefix})))

(fn register-keybindings []
  (let [constants (require :config.constants)
        debugging (require :config.debugging)]
    (debugging.register-keybindings :<Leader>)
    (set-leader-keys constants.leader-key constants.local-leader-key))
  (register-window-keybindings :<Leader>)
  (register-buffer-keybindings :<Leader>)
  (register-formatting-keybindings :<Leader>)
  (register-git-keybindings :<Leader>)
  (register-misc-keybindings :<Leader>)
  (register-location-list-keybindings :<Leader>)
  (register-trouble-keybindings :<Leader>)
  (register-quickfix-keybindings :<Leader>)
  (register-parinfer-keybindings :<Localleader>)
  (register-neotest-keybindings :<Leader>))

{: register-keybindings}
