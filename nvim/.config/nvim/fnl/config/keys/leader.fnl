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
       {1 (.. prefix :xt) 2 ":Trouble todo<CR>" :desc "todo, fixme, bugs..."}
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

(fn register-snacks-keybindings [prefix]
  (let [which-key (require :which-key)
        snacks (require :snacks)]
    (which-key.add
      [
       {1 :<Leader>f :group "find"}
       {1 (.. prefix :f :<space>) 2 (fn [] (snacks.picker.smart)) :desc "smart find files"}
       {1 (.. prefix :f :/) 2 (fn [] (snacks.picker.search_history)) :desc "search history"}
       {1 (.. prefix :f ",") 2 (fn [] (snacks.picker.buffers)) :desc "buffers"}
       {1 (.. prefix :f ":") 2 (fn [] (snacks.picker.command_history)) :desc "command history"}
       {1 (.. prefix :f :R) 2 (fn [] (snacks.picker.resume)) :desc "resume"}
       {1 (.. prefix :f :b) 2 (fn [] (snacks.picker.buffers)) :desc "buffers"}
       {1 (.. prefix :f :f) 2 (fn [] (snacks.picker.files)) :desc "files"}
       {1 (.. prefix :f :c) 2 (fn [] (snacks.picker.files {:cwd (vim.fn.stdpath "config")})) :desc "config"}
       {1 (.. prefix :f :n) 2 (fn [] (snacks.picker.files {:cwd "~/notes"})) :desc "notes"}
       {1 (.. prefix :f :j) 2 (fn [] (snacks.picker.files {:cwd "~/journal"})) :desc "journal"}
       {1 (.. prefix :f :N) 2 (fn [] (snacks.picker.notifications)) :desc "config"}
       {1 (.. prefix :f :r) 2 (fn [] (snacks.picker.lsp_references)) :desc "references"}
       ; {1 (.. prefix :f :r) 2 (fn [] (snacks.picker.recent)) :desc "recent"}
       {1 (.. prefix :f :m) 2 (fn [] (snacks.picker.marks)) :desc "marks"}
       {1 (.. prefix :f :i) 2 (fn [] (snacks.picker.icons)) :desc "icons"}
       {1 (.. prefix :f :d) 2 (fn [] (snacks.picker.diagnostics)) :desc "diagnostics"}
       {1 (.. prefix :f :D) 2 (fn [] (snacks.picker.diagnostics_buffer)) :desc "diagnostics buffer"}
       {1 (.. prefix :f :g) 2 (fn [] (snacks.picker.grep)) :desc "grep"}
       {1 (.. prefix :f :l) 2 (fn [] (snacks.picker.lines)) :desc "buffer lines"}
       {1 (.. prefix :f :B) 2 (fn [] (snacks.picker.grep_buffers)) :desc "grep open buffers"}
       {1 (.. prefix :f :w) 2 (fn [] (snacks.picker.grep_word)) :desc "grep word"}
       {1 (.. prefix :f :s) 2 (fn [] (snacks.picker.lsp_symbols)) :desc "LSP symbols"}
       {1 (.. prefix :f :S) 2 (fn [] (snacks.picker.lsp_workspace_symbols)) :desc "LSP workspace symbols"}
       {1 (.. prefix :f :q) 2 (fn [] (snacks.picker.quickfix)) :desc "quickfix"}
       {1 (.. prefix :f :C) 2 (fn [] (snacks.picker.colorschemes)) :desc "colorschemes"}

       ;; LSP
       ;; Not needed in nvim 0.11
       ; {1 (.. :g :r :r) 2 (fn [] (snacks.picker.lsp_references)) :desc "references"}


       ;; git
       {1 (.. prefix :g :l) 2 (fn [] (snacks.picker.git_log)) :desc "log"}

       ;; Scratch Buffer
       {1 (.. prefix :. ) 2 (fn [] (snacks.scratch)) :desc "toggle scratch buffer"}
       {1 (.. prefix :S ) 2 (fn [] (snacks.scratch.select)) :desc "select scratch buffer"}

       ;; Other
       {1 (.. prefix :e :f) 2 (fn [] (snacks.explorer)) :desc "explorer"}
       {1 (.. prefix :z) 2 (fn [] (snacks.zen)) :desc "toggle zen mode"}
       {1 (.. prefix :u :n) 2 (fn [] (snacks.notifier.hide)) :desc "dismiss all notifications"}])))


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
       {1 (.. prefix :w :c) 2 ":q<CR>" :desc "close"}
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
    (which-key.add
      [{1 (.. prefix :F) :group "Format" :mode [:n :v]}
       {1 (.. prefix :F :e) 2 ":%!jet --pretty<CR>" :desc "edn" :mode [:n :v]}
       {1 (.. prefix :F :j) 2 ":%!jq --sort-keys<CR>" :desc "json" :mode [:n :v]}])))

(fn register-git-keybindings [prefix]
  (let [which-key (require :which-key)
        snacks (require :snacks)]
    (which-key.add
      [{1 (.. prefix :g) :group "git"}
       {1 (.. prefix :g :n) 2 ":Neogit<CR>" :desc "neogit"}
       {1 (.. prefix :g :B) 2 (fn [] (snacks.gitbrowse)) :desc "browse"}
       {1 (.. prefix :g :b) 2 ":Git blame<CR>" :desc "blame"}
       {1 (.. prefix :g :c) 2 ":Git commit<CR>" :desc "commit"}
       {1 (.. prefix :g :d) :group "conflict resolution"}
       {1 (.. prefix :g :s) 2 ":Git<CR>" :desc "status"}
       {1 (.. prefix :g :d :s) 2 ":Gvdiffsplit!<CR>" :desc "diff split"}
       {1 (.. prefix :g :d :h) 2 ":diffget //2<CR>" :desc "get left"}
       {1 (.. prefix :g :d :l) 2 ":diffget //3<CR>" :desc "get right"}
       {1 (.. prefix :g :g) :group "sync"}
       {1 (.. prefix :g :g :p) 2 ":Git push<CR>" :desc "push"}
       {1 (.. prefix :g :g :l) 2 ":Git pull<CR>" :desc "pull"}])))
    ; (which-key.register
    ;   {:g {:name "git"
    ;        :n [":Neogit<cr>" "Neogit"]
    ;        :b [":Git blame<CR>" "blame"]
    ;        :c [":Git commit<CR>" "commit"]
    ;        :d {:name "conflict resolution"
    ;            :s [":Gvdiffsplit!<CR>" "diff split"]
    ;            :h [":diffget //2<CR>" "get left"]
    ;            :l [":diffget //3<CR>" "get right"]}
    ;        :g {:name "sync"
    ;            :p [":Git push<CR>" "push"]
    ;            :l [":Git pull<CR>" "pull"]}
    ;        :s [":Git<CR>" "status"]}}
    ;   {:prefix prefix})))

(fn register-location-list-keybindings [prefix]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :l) :group "location list"}
       {1 (.. prefix :l :l) 2 ":lopen<CR>" :desc "open"}
       {1 (.. prefix :l :n) 2 ":lnext<CR>" :desc "next"}
       {1 (.. prefix :l :o) 2 ":lopen<CR>" :desc "open"}
       {1 (.. prefix :l :p) 2 ":lprevious<CR>" :desc "previous"}
       {1 (.. prefix :l :x) 2 ":lclose<CR>" :desc "close"}])))
    ; (which-key.register
    ;   {:l {:name "location list"
    ;        :l [":lopen<CR>" "open"]
    ;        :n [":lnext<CR>" "next"]
    ;        :o [":lopen<CR>" "open"]
    ;        :p [":lprev<CR>" "previous"]
    ;        :x [":lclose<CR>" "close"]}}
    ;   {:prefix prefix})))

(fn register-quickfix-keybindings [prefix]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :c) :group "quickfix list"}
       {1 (.. prefix :c :c) 2 ":copen<CR>" :desc "open"}
       {1 (.. prefix :c :n) 2 ":cnext<CR>" :desc "next"}
       {1 (.. prefix :c :o) 2 ":copen<CR>" :desc "open"}
       {1 (.. prefix :c :p) 2 ":cprevious<CR>" :desc "previous"}
       {1 (.. prefix :c :x) 2 ":cclose<CR>" :desc "close"}])))
    ; (which-key.register
    ;   {:c {:name "quickfix list"
    ;        :c [":copen<CR>" "open"]
    ;        :n [":cnext<CR>" "next"]
    ;        :o [":copen<CR>" "open"]
    ;        :p [":cprev<CR>" "previous"]
    ;        :x [":cclose<CR>" "close"]}}
    ;   {:prefix prefix})))

(fn register-task-runner-keybindings [prefix]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :o) :group "task runner"}
       {1 (.. prefix :o :o) 2 ":OverseerRun<CR>" :desc "run"}
       {1 (.. prefix :o :v) 2 ":OverseerToggle!<CR>" :desc "toggle"}
       {1 (.. prefix :o :c) 2 ":OverseerRunCmd<CR>" :desc "run command"}
       {1 (.. prefix :o :a) :group "quick action"}
       {1 (.. prefix :o :a :a) 2 ":OverseerQuickAction<CR>" :desc "list"}
       {1 (.. prefix :o :a :s) 2 ":OverseerQuickAction open vsplit<CR>" :desc "vsplit"}
       {1 (.. prefix :o :a :v) 2 ":OverseerQuickAction open vsplit<CR>" :desc "vsplit"}
       {1 (.. prefix :o :a :h) 2 ":OverseerQuickAction open hsplit<CR>" :desc "hsplit"}
       {1 (.. prefix :o :a :d) 2 ":OverseerQuickAction dispose<CR>" :desc "dispose"}
       {1 (.. prefix :o :a :r) 2 ":OverseerQuickAction restart<CR>" :desc "restart"}
       {1 (.. prefix :o :a :o) 2 ":OverseerQuickAction open<CR>" :desc "open"}
       {1 (.. prefix :o :t) 2 ":OverseerTaskAction<CR>" :desc "select task to run an action on"}])))

(fn register-remote-keybindings [prefix]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :r) :group "remote"}
       {1 (.. prefix :r :r) 2 ":RemoteStart<CR>" :desc "start"}
       {1 (.. prefix :r :s) 2 ":RemoteStart<CR>" :desc "start"}
       {1 (.. prefix :r :S) 2 ":RemoteStop<CR>" :desc "stop"}
       {1 (.. prefix :r :q) 2 ":RemoteStop<CR>" :desc "stop"}
       {1 (.. prefix :r :l) 2 ":RemoteLog<CR>" :desc "log"}
       {1 (.. prefix :r :i) 2 ":RemoteInfo<CR>" :desc "info"}])))

(fn register-misc-keybindings [prefix]
  (let [which-key (require :which-key)
        mini-files (require :mini.files)]
    (which-key.add
      [{1 (.. prefix :h) :group "highlight"}
       {1 (.. prefix :h :c) 2 ":togglehiglightatcolorcolumn<CR>" :desc "column toggle"}
       {1 (.. prefix :h :x) 2 ":nohlsearch<CR>" :desc "search off"}
       {1 (.. prefix :n :n) 2 ":set number!<CR>" :desc "number toggle"}
       {1 (.. prefix :p) 2 ":set paste!<CR>\"+p :set paste!<CR>" :desc "paste from clipboard"}
       {1 (.. prefix :s) 2 ":set spell!<CR>" :desc "spell toggle"}
       {1 (.. prefix :e) :group "NvimTree"}
       {1 (.. prefix :e :m) 2 (fn [] (mini-files.open)) :desc "mini"}
       {1 (.. prefix :e :e) 2 ":<C-u>NvimTreeToggle<CR>" :desc "toggle"}
       {1 (.. prefix :e :r) 2 ":<C-u>NvimTreeFindFileToggle<CR>" :desc "find file toggle"}
       {1 (.. prefix :y) 2 "\"+yy" :desc "copy into clipboard" :mode [:n :v]}
       {1 (.. :g :c :c) :desc "comment toggle"}])))
    ; (which-key.register
    ;   {:h {:name "highlight"
    ;        :c [":togglehiglightatcolorcolumn<cr>" "toggle highlight at column"]
    ;        :x [":nohlsearch<CR>" "search highlighting off"]}
    ;    :n [":set number!<CR>" "toggle number"]
    ;    :o [legendary.find "Legendary"]
    ;    :p [":set paste!<CR>\"+p :set paste!<CR>" "paste from clipboard"]
    ;    :s [":set spell!<CR>" "toggle spell"]
    ;    :t {:name "NvimTree"
    ;        :r [":<C-u>NvimTreeFindFileToggle<CR>" "find file toggle"]
    ;        :t [":<C-u>NvimTreeToggle<CR>" "toggle"]}
    ;    :y ["\"+y" "copy into clipboard"]}
    ;   {:prefix prefix})
    ;
    ; (which-key.register
    ;   {:y ["\"+yy" "copy into clipboard"]}
    ;   {:prefix prefix :mode :v})
    ;
    ; (which-key.register
    ;   {:gcc "toggle comment"}
    ;   {})))

(fn register-parinfer-keybindings [prefix]
  (let [which-key (require :which-key)]
    (which-key.add
      [{1 (.. prefix :p) :group "Parinfer"}
       {1 (.. prefix :p) 2 ":ParinferToggle<CR>" :desc "toggle"}])))
    ; (which-key.register
    ;   {:p {:name "parinfer"
    ;        :p [":ParinferToggle<CR>" "toggle"]}}
    ;   {:prefix prefix})))

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
  (register-task-runner-keybindings :<Leader>)
  (register-remote-keybindings :<Leader>)
  (register-location-list-keybindings :<Leader>)
  (register-trouble-keybindings :<Leader>)
  (register-quickfix-keybindings :<Leader>)
  (register-parinfer-keybindings :<Localleader>)
  (register-neotest-keybindings :<Leader>)
  (register-snacks-keybindings :<Leader>))

{: register-keybindings}
