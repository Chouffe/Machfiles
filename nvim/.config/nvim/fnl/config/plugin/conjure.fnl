(module config.plugin.conjure
  {autoload {a aniseed.core
             nvim aniseed.nvim
             str aniseed.string
             sexp config.plugin.sexp
             which-key which-key}})

(def- prefix "<LocalLeader>")

(defn- setup []
  (set nvim.g.conjure#mapping#doc_word "K")
  (set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
  ; (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled true)
  (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false))


(defn- register-keybindings [bufnr]
  (which-key.register
    {:l {:name "log"
         :e "Open log in current buffer"
         :g "Toggle log"
         :l "Jump to last result"
         :q "Close log"
         :r "Clear log"
         :R "Reset log"
         :s "Open log in horizontal split"
         :t "Open log in new tab"
         :v "Open log in vertical split"}
     :E "Evaluate motion"
     :e {:name "eval"
         :! "Replace form with result"
         :b "Evaluate buffer"
         :c {:name "comment"
             :e "Evaluate current form to comment"
             :r "Evaluate root form to comment"
             :w "Evaluate word to comment"}
         :d "Look up documentation"
         :e "Evaluate current form"
         :f "Evaluate file from disk"
         :m "Evaluate form at mark"
         :r "Evaluate root form"
         :w "Evaluate word"}
     :gd "Jump to definition"}
    {:prefix prefix
     :buffer bufnr})

  (which-key.register
    {:E "Evaluate selection"}
    {:prefix prefix
     :mode :v
     :buffer bufnr}))

(defn- register-keymap-clojure [bufnr]
  (which-key.register
    {:c {:name "connection"
         :d "Disconnect from nREPL server"
         :f "Connect via nREPL port file"}
     :ei "Interrupt evaluation"
     :v {:name "view"
         :e "View last exception"
         :1 "View last evaluation result"
         :2 "View 2nd last evaluation result"
         :3 "View 3rd last evaluation result"
         :s "View source"}
     :s {:name "session"
         :c "Clone current session"
         :f "Create fresh session"
         :l "List sessions"
         :n "Next session"
         :p "Previous session"
         :q "Close current session"
         :Q "Close all sessions"
         :s "Select session..."}
     :t {:name "test"
         :a "Run all tests"
         :c "Run test at cursor"
         :n "Run tests in namespace"
         :N "Run tests in alternate namespace"}
     :r {:name "refresh"
         :a "Refresh all namespaces"
         :c "Clear namespace refresh cache"
         :r "Refresh all changed namespaces"}}
    {:prefix prefix :buffer bufnr}))

(defn- register-keymap-fennel [bufnr]
  (which-key.register
    {:c {:name "connection"
         :s "Start REPL"
         :S "Stop REPL"}
     :eF "Reload current file"}
    {:prefix prefix :buffer bufnr}))

(defn- register-keymap-lisp-janet [bufnr]
  (which-key.register
    {:c {:name "connection"
         :c "Connect to REPL"
         :d "Disconnect from REPL"}}
    {:prefix prefix :buffer bufnr}))

(defn- register-keymap-hy-racket [bufnr]
  (which-key.register
    {:c {:name "connection"
         :s "Start REPL"
         :S "Stop REPL"}
     :ei "Interrupt evaluation"}
    {:prefix prefix :buffer bufnr}))

(defn- register-keymap-hy-scheme [bufnr]
  (which-key.register
    {:c {:name "connection"
         :s "Start REPL"
         :S "Stop REPL"}}
    {:prefix prefix :buffer bufnr}))

(defn config []
  (setup)
  ;; TODO: investigate why plugins can't load the config function in sexp
  ;; Hack for now
  (sexp.config)
  (let [group-name :plugin_conjure
        group-id (vim.api.nvim_create_augroup group-name {})]
    (vim.api.nvim_create_autocmd
      :FileType
      {:group group-id
       :pattern (str.join "," (a.get vim.g "conjure#filetypes"))
       :callback #(register-keybindings (nvim.get_current_buf))
       :desc "Keymap bindings for conjure"})
    (vim.api.nvim_create_autocmd
      :FileType
      {:group group-id
       :pattern "clojure"
       :callback #(register-keymap-clojure (nvim.get_current_buf))
       :desc "Keymap bindings for conjure Clojure"})
    (vim.api.nvim_create_autocmd
      :FileType
      {:group group-id
       :pattern "fennel"
       :callback #(register-keymap-fennel (nvim.get_current_buf))
       :desc "Keymap bindings for conjure Fennel"})
    (vim.api.nvim_create_autocmd
      :FileType
      {:group group-id
       :pattern "lisp,janet"
       :callback #(register-keymap-lisp-janet (nvim.get_current_buf))
       :desc "Keymap bindings for conjure Lisp, Janet"})
    (vim.api.nvim_create_autocmd
      :FileType
      {:group group-id
       :pattern "hy,racket"
       :callback #(register-keymap-hy-racket (nvim.get_current_buf))
       :desc "Keymap bindings for conjure Hy, Racket"})
    (vim.api.nvim_create_autocmd
      :FileType
      {:group group-id
       :pattern "Scheme"
       :callback #(register-keymap-hy-scheme (nvim.get_current_buf))
       :desc "Keymap bindings for conjure Scheme"})))
