(module config.keys.leader
  {autoload {a aniseed.core
             nvim aniseed.nvim
             str aniseed.string
             functions config.general.functions
             which-key which-key}})

(def- prefix "<Leader>")

(defn- register-buffer-keybindings []
  (which-key.register
    {:b {:name "buffer"
         :d [functions.delete_buffer "delete"]
         :n [":bnext<CR>" "next"]
         :p [":bprevious<CR>" "previous"]
         :o [":only<CR>" "only"]
         :w [":w<CR>" "write|save"]}}
    {:prefix prefix}))

(defn- register-window-keybindings []
  (which-key.register
    {:w {:name "window"
         :o [":only<CR>" "only"]
         :q [":q<CR>" "quit"]}
     :k [":vsplit<CR>" "vertical split"]
     :j [":split<CR>" "horizontal split"]}
    {:prefix prefix}))

(defn- register-formatting-keybindings []
  (which-key.register
    {:F {:name "format"
         :j [":%!jq --sort-keys<CR>" "Format json"]
         :e [":%!jet --pretty<CR>" "Format edn"]}}
    {:prefix prefix})
  (which-key.register
    {:F {:name "format"
         :j [":!jq --sort-keys<CR>" "Format json"]
         :e [":!jet --pretty<CR>" "Format edn"]}}
    {:prefix prefix :mode :v}))

(defn- register-git-keybindings []
  (which-key.register
    {:g {:name "git"
         :c [":Git commit<CR>" "commit"]
         :gp [":Git push<CR>" "push"]
         :gl [":Git pull<CR>" "pull"]
         :b [":Git blame<CR>" "blame"]
         :d {:name "conflict resolution"
             :s [":Gvdiffsplit!<CR>" "diff split"]
             :h [":diffget //2<CR>" "get left"]
             :l [":diffget //3<CR>" "get right"]}
         :s [":Git<CR>" "status"]}}
    {:prefix prefix}))

(defn- register-misc-keybindings []
  (which-key.register
    {:t {:name "NvimTree"
         :t [":<C-u>NvimTreeToggle<CR>" "toggle"]
         :r [":<C-u>NvimTreeFindFileToggle<CR>" "find file toggle"]}
     :<CR> [":nohlsearch<CR>" "search highlighting off"]
     :p [":set paste!<CR>\"+p :set paste!<CR>" "paste from clipboard"]
     :s [":set spell!<CR>" "toggle spell"]
     :n [":set number!<CR>" "toggle number"]
     :c [":ToggleHiglightAtColorColumn<CR>" "toggle highlight at column"]}
    {:prefix prefix}))

(defn register-keybindings []
  (register-window-keybindings)
  (register-buffer-keybindings)
  (register-formatting-keybindings)
  (register-git-keybindings)
  (register-misc-keybindings))
