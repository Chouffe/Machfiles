(module config.keys.leader
  {autoload {a aniseed.core
             nvim aniseed.nvim
             str aniseed.string
             functions config.general.functions
             legendary legendary
             constants config.constants
             t telescope.builtin
             trouble trouble
             which-key which-key}})

(defn- set-leader-keys [leader-key local-leader-key]
  (set nvim.g.mapleader leader-key)
  (set nvim.g.maplocalleader local-leader-key))

(defn- register-trouble-keybindings [prefix]
  (which-key.register
    {:x {:name "trouble"
         :x [trouble.toggle "all"]
         :w [(fn [] (trouble.toggle :workspace_diagnostics)) "workspace diagnostics"]
         :d [(fn [] (trouble.toggle :document_diagnostics)) "document diagnostics"]
         :q [(fn [] (trouble.toggle :quickfix)) "quickfix"]
         :l [(fn [] (trouble.toggle :loclist)) "loclist"]
         :r [(fn [] (trouble.toggle :lsp_references)) "lsp references"]}}
    {:prefix prefix}))

(defn- register-buffer-keybindings [prefix]
  (which-key.register
    {:b {:name "buffer"
         :d [functions.delete_buffer "delete"]
         :l [t.buffers "list"]
         :n [":bnext<CR>" "next"]
         :o [":only<CR>" "only"]
         :p [":bprevious<CR>" "previous"]
         :w [":w<CR>" "write|save"]}}
    {:prefix prefix}))

(defn- register-window-keybindings [prefix]
  (which-key.register
    {:w {:name "window"
         :o [":only<CR>" "only"]
         :w [":w<CR>" "write|save"]
         :q [":q<CR>" "quit"]}
     :j [":split<CR>" "horizontal split"]
     :k [":vsplit<CR>" "vertical split"]}
    {:prefix prefix}))

(defn- register-formatting-keybindings [prefix]
  (which-key.register
    {:F {:name "format"
         :e [":%!jet --pretty<CR>" "Format edn"]
         :j [":%!jq --sort-keys<CR>" "Format json"]}}
    {:prefix prefix})
  (which-key.register
    {:F {:name "format"
         :j [":!jq --sort-keys<CR>" "Format json"]
         :e [":!jet --pretty<CR>" "Format edn"]}}
    {:prefix prefix :mode :v}))

(defn- register-git-keybindings [prefix]
  (which-key.register
    {:g {:name "git"
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
    {:prefix prefix}))

(defn- register-location-list-keybindings [prefix]
  (which-key.register
    {:l {:name "location list"
         :l [":lopen<CR>" "open"]
         :n [":lnext<CR>" "next"]
         :o [":lopen<CR>" "open"]
         :p [":lprev<CR>" "previous"]
         :x [":lclose<CR>" "close"]}}
    {:prefix prefix}))

(defn- register-quickfix-keybindings [prefix]
  (which-key.register
    {:c {:name "quickfix list"
         :c [":copen<CR>" "open"]
         :n [":cnext<CR>" "next"]
         :o [":copen<CR>" "open"]
         :p [":cprev<CR>" "previous"]
         :x [":cclose<CR>" "close"]}}
    {:prefix prefix}))

(defn- register-misc-keybindings [prefix]
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
    {}))

(defn- register-parinfer-keybindings [prefix]
  (which-key.register
    {:p {:name "parinfer"
         :p [":ParinferToggle<CR>" "toggle"]}}
    {:prefix prefix}))

(defn register-keybindings []
  (set-leader-keys constants.leader-key constants.local-leader-key)
  (register-window-keybindings :<Leader>)
  (register-buffer-keybindings :<Leader>)
  (register-formatting-keybindings :<Leader>)
  (register-git-keybindings :<Leader>)
  (register-misc-keybindings :<Leader>)
  (register-location-list-keybindings :<Leader>)
  (register-trouble-keybindings :<Leader>)
  (register-quickfix-keybindings :<Leader>)
  (register-parinfer-keybindings :<Localleader>))
